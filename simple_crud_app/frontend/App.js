import React from "react";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import TaskListScreen from "./src/screens/TaskListScreen";

const queryClient = new QueryClient();

export default function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <TaskListScreen />
    </QueryClientProvider>
  );
}