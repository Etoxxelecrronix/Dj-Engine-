import React from 'react';
import PlaceholderPage from '../components/PlaceholderPage';

interface SettingsPageProps {
  navigation: any;
}

const SettingsPage: React.FC<SettingsPageProps> = ({ navigation }) => {
  return (
    <PlaceholderPage
      pageTitle="Settings"
      pageName="settings"
      description="Counter settings like step size and themes"
      suggestedPrompt="Add settings for custom increment values and color themes"
    />
  );
};

export default SettingsPage;
