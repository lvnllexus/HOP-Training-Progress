import React from "react";
import TaskListScreen from "../../src/screens/TaskListScreen";
import { useTheme } from "@/app/context/ThemeContext";

export default function Home() {
  const { theme } = useTheme();
  const isDark = theme === "dark";

  return <TaskListScreen theme={isDark ? "dark" : "light"} />;
}