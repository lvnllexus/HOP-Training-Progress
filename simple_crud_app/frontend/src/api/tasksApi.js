import axios from "axios";

const api = axios.create({
  baseURL: "http://192.168.1.35:3000/api/v1", // <-- replace with your PC's LAN IP
  headers: {
    "Content-Type": "application/json",
  },
});

export const fetchTasks = async () => {
  const response = await api.get("/tasks");
  return response.data;
};

export const createTask = async (task) => {
  const response = await api.post("/tasks", { task });
  return response.data;
};

export const updateTask = async (id, task) => {
  const response = await api.patch(`/tasks/${id}`, { task });
  return response.data;
};

export const deleteTask = async (id) => {
  const response = await api.delete(`/tasks/${id}`);
  return response.data;
};

export default api;