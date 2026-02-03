import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import { AppTheme } from './theme/AppTheme';

// Import screens
import CounterPage from './screens/CounterPage';

const Stack = createNativeStackNavigator();

function App() {
  return (
    <SafeAreaProvider>
      <NavigationContainer>
        <Stack.Navigator
          initialRouteName="Counter"
          screenOptions={{
            headerStyle: {
              backgroundColor: AppTheme.colors.primary,
            },
            headerTintColor: '#FFFFFF',
            headerTitleStyle: {
              fontWeight: AppTheme.typography.fontWeight.semibold as any,
              fontSize: AppTheme.typography.fontSize.xl,
            },
            headerShadowVisible: true,
            animation: 'slide_from_right',
          }}
        >
          <Stack.Screen
            name="Counter"
            component={CounterPage}
            options={{
              headerShown: false,
            }}
          />
        </Stack.Navigator>
      </NavigationContainer>
    </SafeAreaProvider>
  );
}

export default App;
