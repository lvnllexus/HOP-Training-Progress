// frontend/app/_layout.tsx (or frontend/app/_layout.js)
import React from "react";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { ThemeProvider } from "./context/ThemeContext"; // import your fixed ThemeProvider
import { Slot } from "expo-router";

const queryClient = new QueryClient();

export default function RootLayout() {
  return (
    <ThemeProvider>
      <QueryClientProvider client={queryClient}>
        <Slot />
      </QueryClientProvider>
    </ThemeProvider>
  );
}