import React, { useState, useMemo } from "react";
import {
  View,
  Text,
  FlatList,
  TextInput,
  TouchableOpacity,
  StyleSheet,
  ActivityIndicator,
  RefreshControl,
  Alert,
} from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { fetchTasks, createTask, updateTask, deleteTask } from "../api/tasksApi";

export default function TaskListScreen({ theme }) {
  const isDark = theme === "dark";
  const queryClient = useQueryClient();
  const [newTask, setNewTask] = useState("");
  const [refreshing, setRefreshing] = useState(false);

  const { data: tasks = [], isLoading, error, refetch } = useQuery({
    queryKey: ["tasks"],
    queryFn: fetchTasks,
  });

  const activeTaskCount = useMemo(() => tasks.filter((task) => !task.completed).length, [tasks]);

  const createMutation = useMutation({
    mutationFn: createTask,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["tasks"] });
      setNewTask("");
    },
  });

  const updateMutation = useMutation({
    mutationFn: ({ id, task }) => updateTask(id, task),
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ["tasks"] }),
  });

  const deleteMutation = useMutation({
    mutationFn: deleteTask,
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ["tasks"] }),
  });

  const handleAddTask = () => {
    if (!newTask.trim()) return Alert.alert("Error", "Task title cannot be empty");
    createMutation.mutate({ title: newTask, completed: false });
  };

  const toggleComplete = (task) => updateMutation.mutate({ id: task.id, task: { completed: !task.completed } });

  const handleDelete = (id) => {
    Alert.alert("Delete Task", "Are you sure?", [
      { text: "Cancel", style: "cancel" },
      { text: "Delete", style: "destructive", onPress: () => deleteMutation.mutate(id) },
    ]);
  };

  const onRefresh = async () => {
    setRefreshing(true);
    await refetch();
    setRefreshing(false);
  };

  if (isLoading) {
    return (
      <SafeAreaView style={[styles.center, { backgroundColor: isDark ? "#121212" : "#f5f7fa" }]}>
        <ActivityIndicator size="large" color={isDark ? "#fff" : "#007bff"} />
        <Text style={{ marginTop: 10, color: isDark ? "#fff" : "#000" }}>Loading tasks...</Text>
      </SafeAreaView>
    );
  }

  if (error) {
    return (
      <SafeAreaView style={[styles.center, { backgroundColor: isDark ? "#121212" : "#f5f7fa" }]}>
        <Text style={{ color: isDark ? "#fff" : "#000" }}>Error loading tasks</Text>
      </SafeAreaView>
    );
  }

  return (
    <SafeAreaView style={[styles.safeArea, { backgroundColor: isDark ? "#121212" : "#f5f7fa" }]}>
      <View style={styles.container}>
        <Text style={[styles.title, { color: isDark ? "#fff" : "#000" }]}>My Tasks</Text>

        <Text style={[styles.counter, { color: isDark ? "#ccc" : "gray" }]}>
          {activeTaskCount === 0 ? "All tasks completed 🎉" : `${activeTaskCount} Task${activeTaskCount > 1 ? "s" : ""} Remaining`}
        </Text>

        <View style={styles.inputContainer}>
          <TextInput
            style={[
              styles.input,
              {
                backgroundColor: isDark ? "#1e1e1e" : "#fff",
                color: isDark ? "#fff" : "#000",
                borderColor: isDark ? "#333" : "#ddd",
              },
            ]}
            placeholder="Enter new task..."
            placeholderTextColor={isDark ? "#888" : "#aaa"}
            value={newTask}
            onChangeText={setNewTask}
          />
          <TouchableOpacity
            style={[styles.addButton, createMutation.isPending && styles.disabledButton]}
            onPress={handleAddTask}
            disabled={createMutation.isPending}
          >
            {createMutation.isPending ? <ActivityIndicator color="#fff" /> : <Text style={styles.buttonText}>Add</Text>}
          </TouchableOpacity>
        </View>

        <FlatList
          data={tasks}
          keyExtractor={(item) => item.id.toString()}
          refreshControl={<RefreshControl refreshing={refreshing} onRefresh={onRefresh} />}
          renderItem={({ item }) => (
            <View style={[styles.taskItem, { backgroundColor: isDark ? "#1e1e1e" : "#fff" }]}>
              <TouchableOpacity style={styles.taskLeft} onPress={() => toggleComplete(item)}>
                <View
                  style={[
                    styles.checkbox,
                    item.completed && styles.checkboxCompleted,
                    { borderColor: "#007bff" },
                  ]}
                />
                <Text style={[styles.taskText, item.completed && styles.completed, { color: isDark ? "#fff" : "#000" }]}>
                  {item.title}
                </Text>
              </TouchableOpacity>
              <TouchableOpacity style={styles.deleteButton} onPress={() => handleDelete(item.id)}>
                <Text style={styles.deleteText}>Delete</Text>
              </TouchableOpacity>
            </View>
          )}
          contentContainerStyle={{ paddingBottom: 100 }}
        />
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safeArea: { flex: 1 },
  container: { flex: 1, paddingHorizontal: 20, paddingTop: 10 },
  title: { fontSize: 26, fontWeight: "bold" },
  counter: { marginTop: 5, marginBottom: 20, fontSize: 14 },
  inputContainer: { flexDirection: "row", marginBottom: 20 },
  input: { flex: 1, borderWidth: 1, padding: 12, borderRadius: 10, marginRight: 10 },
  addButton: { backgroundColor: "#007bff", paddingHorizontal: 18, justifyContent: "center", borderRadius: 10 },
  disabledButton: { opacity: 0.6 },
  buttonText: { color: "#fff", fontWeight: "bold" },
  taskItem: { flexDirection: "row", alignItems: "flex-start", padding: 15, borderRadius: 10, marginBottom: 10, elevation: 2 },
  taskLeft: { flex: 1, flexDirection: "row", alignItems: "flex-start", marginRight: 10 },
  checkbox: { width: 22, height: 22, borderWidth: 2, borderColor: "#007bff", borderRadius: 5, marginRight: 10, marginTop: 2 },
  checkboxCompleted: { backgroundColor: "#007bff" },
  taskText: { flex: 1, fontSize: 16, flexWrap: "wrap" },
  completed: { textDecorationLine: "line-through", color: "gray" },
  deleteButton: { paddingHorizontal: 10, paddingVertical: 5 },
  deleteText: { color: "red", fontWeight: "bold" },
  center: { flex: 1, justifyContent: "center", alignItems: "center" },
});