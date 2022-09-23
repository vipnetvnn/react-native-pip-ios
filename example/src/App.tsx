import * as React from 'react';
import { useState, useEffect, useRef } from 'react';
import * as ReactNative from 'react-native';
import { StyleSheet, UIManager, View, Text } from 'react-native';
import { PipIosView } from 'react-native-pip-ios';

export default function App() {
  const pipView = useRef(null);

  const pip = () => {
    console.log('pipViewzzzz', pipView);
    if (pipView.current) {
      UIManager.dispatchViewManagerCommand(
        ReactNative.findNodeHandle(pipView.current),
        UIManager.getViewManagerConfig('PipIosView').Commands.toggle,
        []
      );
    }
  };
  return (
    <View style={styles.container}>
      <PipIosView color="#32a852" style={styles.box} ref={pipView} />
      <ReactNative.TouchableOpacity
        onPress={() => {
          console.log('presss button');
          pip();
        }}
      >
        <Text>test</Text>
      </ReactNative.TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
