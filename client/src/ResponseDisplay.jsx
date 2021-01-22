import React from 'react';
import SuspenseLoader from './SuspenseLoader';

const ResponseDisplay = ({ response, isSending }) => {
  return isSending ? (
    <SuspenseLoader />
  ) : (
    <pre>{JSON.stringify(response, undefined, 4)}</pre>
  );
};

export default ResponseDisplay;
