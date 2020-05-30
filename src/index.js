import React, { useState, useEffect } from 'react';
import axios from 'axios';
import ReactDOM from 'react-dom';

function App(props) {
  const [data, setData] = useState();
  useEffect(() => {
    console.log(process.env.REACT_APP_API_URL)

    axios.get(`http://${process.env.REACT_APP_API_URL}:8080` +
      `/api/v1.0/resource`)

      .then(response => {

        setData(response.data);

      }).catch(error => {
        console.log(error);
      });
  }, []);
  return (
    <div>
      {data ? Object.values(data) : ''}
    </div>
  );
}

ReactDOM.render(<App />, document.getElementById('root'));
