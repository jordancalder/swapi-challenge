import React from 'react';
import SuspenseLoader from './SuspenseLoader';
import './ResponseDisplay.css'

const URL_REGEX = /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)/;

const ExploreLink = ({ link, setEndpoint, handleFetchData }) => {
  const [, tail] = link.split('/api/');

  const clickHandler = () =>
    setEndpoint(tail);

  return (<span className="resourceLink" onClick={clickHandler}>        {link},<br /></span>);
}

const ResponseDisplay = ({ response, isSending, setEndpoint, handleFetchData }) => {
  const formattedResponse = JSON.stringify(response, undefined, 4);

  const renderText = txt =>
    txt
      .split("\n")
      .map(part =>
        URL_REGEX.test(part) && /^((?!":).)*$/.test(part) ? <ExploreLink link={part.match(URL_REGEX)[0]} setEndpoint={setEndpoint} handleFetchData={handleFetchData} /> : part + "\n"
      );

  return isSending ? (
    <SuspenseLoader />
  ) : (
    <pre>{renderText(formattedResponse)}</pre>
  );
};

export default ResponseDisplay;
