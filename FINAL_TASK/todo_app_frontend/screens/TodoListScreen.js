import React, { useEffect, useState } from 'react';
import {
  View,
  Text,
  FlatList,
  TouchableOpacity,
  TextInput,
  Button,
  StyleSheet,
  Alert,
  KeyboardAvoidingView,
  TouchableWithoutFeedback,
  Keyboard,
  Platform,
} from 'react-native';
import Modal from 'react-native-modal';

export default function TodoListScreen() {
  const [todos, setTodos] = useState([]);
  const [modalVisible, setModalVisible] = useState(false);
  const [editModalVisible, setEditModalVisible] = useState(false);
  const [newTitle, setNewTitle] = useState('');
  const [editTitle, setEditTitle] = useState('');
  const [editTodoId, setEditTodoId] = useState(null);

  // Change this to your PC IP when testing on physical phone
  const API_URL = 'http://192.168.1.16:3000/todos';
  // For Android emulator, use 'http://244.178.44.111:3000/todos' based on your emulator IP

  // Fetch todos from backend
  const fetchTodos = async () => {
    try {
      const response = await fetch(API_URL);
      const data = await response.json();
      setTodos(data);
    } catch (error) {
      console.error(error);
    }
  };

  useEffect(() => {
    fetchTodos();
  }, []);

  // Add new todo
  const addTodo = async () => {
    if (!newTitle.trim()) return;
    try {
      await fetch(API_URL, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ todo: { title: newTitle, completed: false } }),
      });
      setNewTitle('');
      setModalVisible(false);
      fetchTodos();
    } catch (error) {
      console.error(error);
    }
  };

  // Toggle completed
  const toggleCompleted = async (todo) => {
    try {
      await fetch(`${API_URL}/${todo.id}`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ todo: { completed: !todo.completed } }),
      });
      fetchTodos();
    } catch (error) {
      console.error(error);
    }
  };

  // Delete todo
  const deleteTodo = async (id) => {
    Alert.alert('Delete Todo', 'Are you sure?', [
      { text: 'Cancel' },
      {
        text: 'Delete',
        onPress: async () => {
          try {
            await fetch(`${API_URL}/${id}`, { method: 'DELETE' });
            fetchTodos();
          } catch (error) {
            console.error(error);
          }
        },
      },
    ]);
  };

  // Open edit modal
  const openEditModal = (todo) => {
    setEditTitle(todo.title);
    setEditTodoId(todo.id);
    setEditModalVisible(true);
  };

  // Edit todo
  const editTodo = async () => {
    if (!editTitle.trim()) return;
    try {
      await fetch(`${API_URL}/${editTodoId}`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ todo: { title: editTitle } }),
      });
      setEditTitle('');
      setEditTodoId(null);
      setEditModalVisible(false);
      fetchTodos();
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <View style={styles.container}>
      {/* Todos List */}
      <FlatList
        data={todos}
        keyExtractor={(item) => item.id.toString()}
        renderItem={({ item }) => (
          <View style={styles.todoItem}>
            <TouchableOpacity onPress={() => toggleCompleted(item)}>
              <Text style={item.completed ? styles.completed : null}>{item.title}</Text>
            </TouchableOpacity>
            <View style={styles.buttons}>
              <Button title="Edit" onPress={() => openEditModal(item)} />
              <Button title="Delete" onPress={() => deleteTodo(item.id)} color="red" />
            </View>
          </View>
        )}
        contentContainerStyle={{ paddingBottom: 100 }}
      />

      {/* Add Todo button pinned at bottom */}
      <View style={styles.addButtonContainer}>
        <Button title="Add Todo" onPress={() => setModalVisible(true)} />
      </View>

      {/* Add Modal */}
      <Modal isVisible={modalVisible} avoidKeyboard={true}>
        <KeyboardAvoidingView
          behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
          style={styles.modalContainer}
        >
          <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
            <View style={styles.modal}>
              <TextInput
                placeholder="Todo title"
                value={newTitle}
                onChangeText={setNewTitle}
                style={styles.input}
              />
              <Button title="Add" onPress={addTodo} />
              <Button title="Cancel" onPress={() => setModalVisible(false)} />
            </View>
          </TouchableWithoutFeedback>
        </KeyboardAvoidingView>
      </Modal>

      {/* Edit Modal */}
      <Modal isVisible={editModalVisible} avoidKeyboard={true}>
        <KeyboardAvoidingView
          behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
          style={styles.modalContainer}
        >
          <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
            <View style={styles.modal}>
              <TextInput
                placeholder="Edit todo"
                value={editTitle}
                onChangeText={setEditTitle}
                style={styles.input}
              />
              <Button title="Save" onPress={editTodo} />
              <Button title="Cancel" onPress={() => setEditModalVisible(false)} />
            </View>
          </TouchableWithoutFeedback>
        </KeyboardAvoidingView>
      </Modal>
    </View>
  );
}

// Styles
const styles = StyleSheet.create({
  container: { flex: 1, padding: 20, backgroundColor: '#f9f9f9' },
  todoItem: {
    padding: 10,
    borderBottomWidth: 1,
    borderBottomColor: '#ccc',
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  buttons: { flexDirection: 'row', gap: 5 },
  completed: { textDecorationLine: 'line-through', color: 'gray' },
  addButtonContainer: {
    position: 'absolute',
    bottom: 20,
    left: 20,
    right: 20,
  },
  modalContainer: { flex: 1, justifyContent: 'center', alignItems: 'center' },
  modal: { backgroundColor: 'white', padding: 20, borderRadius: 10, width: '90%' },
  input: { borderWidth: 1, borderColor: '#ccc', padding: 10, marginBottom: 10, borderRadius: 5 },
});

