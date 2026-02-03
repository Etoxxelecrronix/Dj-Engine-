import React from 'react';
import PlaceholderPage from '../components/PlaceholderPage';

interface HistoryPageProps {
  navigation: any;
}

const HistoryPage: React.FC<HistoryPageProps> = ({ navigation }) => {
  return (
    <PlaceholderPage
      pageTitle="History"
      pageName="history"
      description="View counter history and previous sessions"
      suggestedPrompt="Add history page to track counter changes over time"
    />
  );
};

export default HistoryPage;
