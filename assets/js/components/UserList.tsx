import React from "react";
import gql from "graphql-tag";
import { useQuery } from "@apollo/react-hooks";

const LIST_USERS = gql`
  {
    listUsers {
      name
      email
    }
  }
`;

const UserList = () => {
  console.log("data");
  const { loading, error, data } = useQuery(LIST_USERS);
  if (loading) {
    return <div>Loading....</div>;
  }
  if (error) {
    return <div>Error: {JSON.stringify(error)}</div>;
  }
  console.warn({ data });
  return (
    <div>
      {data.listUsers.map((user: any, userId: number) => (
        <div key={userId}>{user.name}</div>
      ))}
    </div>
  );
};

export default UserList;
