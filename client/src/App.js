import React, { useCallback, useState } from 'react';
import ResponseDisplay from './ResponseDisplay';
import './App.css';

function App() {
  const [endpoint, setEndpoint] = useState();
  const [response, setResponse] = useState('{}');
  const [isSending, setIsSending] = useState(false);

  const handleInputChange = e =>
    setEndpoint(e.target.value);

  const handleFetchData = useCallback(async () => {
    if (isSending) return;

    setIsSending(true);

    const res = await fetch(`http://localhost:3001/api/${endpoint}`)

    const body = await res.json();

    setResponse(body);

    setIsSending(false);
  }, [isSending, endpoint]);

  return (
    <div className="App">
      <div className="form-group">
        <span>https://swapi.dev/api/</span>
        <input onChange={handleInputChange} value={endpoint} className="form-field" type="text" placeholder=":resource/:id" />
      </div>

      <div className="form-group">
        <input type="button" disabled={isSending} onClick={handleFetchData} value="request" />
      </div>

      <ResponseDisplay response={response} isSending={isSending} setEndpoint={setEndpoint} handleFetchData={handleFetchData} />
    </div>
  );
}

export default App;
