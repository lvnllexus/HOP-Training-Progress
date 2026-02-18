import React, { useEffect, useState } from 'react';
import {
  View,
  Text,
  FlatList,
  TouchableOpacity,
  TextInput,
  StyleSheet,
  Alert,
  KeyboardAvoidingView,
  TouchableWithoutFeedback,
  Keyboard,
  Platform,
  ScrollView,
} from 'react-native';
import Modal from 'react-native-modal';
import { useTheme } from '@/app/context/ThemeContext';

export default function TodoListScreen() {
  const { theme } = useTheme(); // Get current theme for styling

  const [todos, setTodos] = useState([]);
  const [modalVisible, setModalVisible] = useState(false);
  const [editModalVisible, setEditModalVisible] = useState(false);
  const [newTitle, setNewTitle] = useState('');
  const [editTitle, setEditTitle] = useState('');
  const [editTodoId, setEditTodoId] = useState(null);

  const API_URL = 'http://192.168.1.16:3000/todos'; //Use your local IP in order to connect to the backend from the mobile app

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

  const openEditModal = (todo) => {
    setEditTitle(todo.title);
    setEditTodoId(todo.id);
    setEditModalVisible(true);
  };

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

  // Theme-based styles
  const isDark = theme === 'dark';
  const backgroundColor = isDark ? '#121212' : '#f9f9f9';
  const textColor = isDark ? '#ffffff' : '#000000';
  const inputBackground = isDark ? '#1e1e1e' : '#ffffff';
  const borderColor = isDark ? '#333' : '#ccc';

  return (
    <View style={[styles.container, { backgroundColor }]}>
      {/* Todos List */}
      <FlatList
        data={todos}
        keyExtractor={(item) => item.id.toString()}
        renderItem={({ item }) => (
          <View
            style={[
              styles.todoItem,
              { backgroundColor: inputBackground, borderColor },
            ]}
          >
            <TouchableOpacity style={{ flex: 1 }} onPress={() => toggleCompleted(item)}>
              <Text style={[styles.todoText, item.completed && styles.completed, { color: textColor }]}>
                {item.title}
              </Text>
            </TouchableOpacity>

            <View style={styles.buttons}>
              <TouchableOpacity
                style={[styles.smallButton, styles.editButton]}
                onPress={() => openEditModal(item)}
              >
                <Text style={styles.smallButtonText}>Edit</Text>
              </TouchableOpacity>
              <TouchableOpacity
                style={[styles.smallButton, styles.deleteButton]}
                onPress={() => deleteTodo(item.id)}
              >
                <Text style={styles.smallButtonText}>Delete</Text>
              </TouchableOpacity>
            </View>
          </View>
        )}
        contentContainerStyle={{ paddingBottom: 100 }}
      />

      {/* Add Todo button */}
      <View style={styles.addButtonContainer}>
        <TouchableOpacity
          style={[styles.addButton, styles.largeAddButton]}
          onPress={() => setModalVisible(true)}
        >
          <Text style={[styles.smallButtonText, styles.largeAddButtonText]}>Add Todo</Text>
        </TouchableOpacity>
      </View>

      {/* Add Modal */}
      <Modal isVisible={modalVisible} avoidKeyboard={true}>
        <KeyboardAvoidingView
          behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
          style={styles.modalContainer}
        >
          <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
            <View style={[styles.modal, { backgroundColor: inputBackground }]}>
              <TextInput
                placeholder="Todo title"
                placeholderTextColor={isDark ? '#888' : '#aaa'}
                value={newTitle}
                onChangeText={setNewTitle}
                style={[styles.input, { backgroundColor: inputBackground, borderColor, color: textColor }]}
                multiline
              />
              <View style={[styles.modalButtons, { gap: 12 }]}>
                <TouchableOpacity style={[styles.smallButton, styles.editButton]} onPress={addTodo}>
                  <Text style={styles.smallButtonText}>Add</Text>
                </TouchableOpacity>
                <TouchableOpacity style={[styles.smallButton, styles.deleteButton]} onPress={() => setModalVisible(false)}>
                  <Text style={styles.smallButtonText}>Cancel</Text>
                </TouchableOpacity>
              </View>
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
          <ScrollView contentContainerStyle={{ flexGrow: 1, justifyContent: 'center' }}>
            <View style={[styles.modal, { backgroundColor: inputBackground }]}>
              <TextInput
                placeholder="Edit todo"
                placeholderTextColor={isDark ? '#888' : '#aaa'}
                value={editTitle}
                onChangeText={setEditTitle}
                style={[styles.input, { backgroundColor: inputBackground, borderColor, color: textColor }]}
                multiline
              />
              <View style={[styles.modalButtons, { gap: 12 }]}>
                <TouchableOpacity style={[styles.smallButton, styles.editButton]} onPress={editTodo}>
                  <Text style={styles.smallButtonText}>Save</Text>
                </TouchableOpacity>
                <TouchableOpacity style={[styles.smallButton, styles.deleteButton]} onPress={() => setEditModalVisible(false)}>
                  <Text style={styles.smallButtonText}>Cancel</Text>
                </TouchableOpacity>
              </View>
            </View>
          </ScrollView>
        </KeyboardAvoidingView>
      </Modal>
    </View>
  );
}

// Styles
const styles = StyleSheet.create({
  container: { flex: 1, paddingHorizontal: 20, paddingBottom: 20, paddingTop: 10 },
  todoItem: { padding: 15, marginBottom: 10, borderRadius: 12, borderWidth: 1, flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center' },
  todoText: { fontSize: 16, flexShrink: 1 },
  buttons: { flexDirection: 'row', gap: 8 },
  smallButton: { paddingVertical: 6, paddingHorizontal: 12, borderRadius: 8, alignItems: 'center', justifyContent: 'center' },
  smallButtonText: { color: 'white', fontWeight: 'bold' },
  editButton: { backgroundColor: '#4caf50' },
  deleteButton: { backgroundColor: '#f44336' },
  addButton: { backgroundColor: '#2196f3' },
  completed: { textDecorationLine: 'line-through', color: 'gray' },
  addButtonContainer: { position: 'absolute', bottom: 20, left: 20, right: 20 },
  modalContainer: { flex: 1, justifyContent: 'center', alignItems: 'center' },
  modal: { padding: 20, borderRadius: 12, width: '90%' },
  modalButtons: { flexDirection: 'row', justifyContent: 'space-between', marginTop: 10 },
  input: { borderWidth: 1, padding: 10, borderRadius: 8, marginBottom: 10, textAlignVertical: 'top' },
  largeAddButton: { paddingVertical: 14, paddingHorizontal: 24, borderRadius: 12, alignItems: 'center', justifyContent: 'center', borderCurve: 'continuous' },
  largeAddButtonText: { fontSize: 16, fontWeight: 'bold', color: 'white' },
});
