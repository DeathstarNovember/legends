import React, { useState } from "react";
import { ApolloClient } from "apollo-client";
import { InMemoryCache } from "apollo-cache-inmemory";
import { HttpLink } from "apollo-link-http";
import { onError } from "apollo-link-error";
import { ApolloLink } from "apollo-link";
import { ApolloProvider } from "@apollo/react-hooks";
import UserList from "./components/UserList";
import Header from "./components/Header";
import UserStoryline from "./components/UserStoryline";

const uri = "http://localhost:4000/api";
const client = new ApolloClient({
  link: ApolloLink.from([
    onError(({ graphQLErrors, networkError }) => {
      if (graphQLErrors)
        graphQLErrors.forEach(({ message, locations, path }) =>
          console.log(
            `[GraphQL error]: Message: ${message}, Location: ${locations}, Path: ${path}`
          )
        );
      if (networkError) console.log(`[Network error]: ${networkError}`);
    }),
    new HttpLink({
      uri,
    }),
  ]),
  cache: new InMemoryCache(),
});

const Root: React.FC = () => {
  const [currentUserId, setCurrentUserId] = useState<number | null>(null);
  return (
    <ApolloProvider client={client}>
      <Header />
      {currentUserId ? (
        <UserStoryline userId={currentUserId} />
      ) : (
        <UserList login={setCurrentUserId} />
      )}
    </ApolloProvider>
  );
};

export default Root;
