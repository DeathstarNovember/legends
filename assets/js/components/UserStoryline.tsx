import React from "react";
import { useQuery } from "@apollo/react-hooks";
import gql from "graphql-tag";

type UserStorylineProps = {
  userId: number;
};

const GET_CURRENT_USER = gql`
  query getUser($id: ID!) {
    getUser(id: $id) {
      id
      name
      email
      posts {
        body
        chapter
        description
        endDate
        sortOrder
        startDate
        title
      }
    }
  }
`;

const UserStoryline: React.FC<UserStorylineProps> = ({ userId }) => {
  const {
    data: currentUserData,
    loading: currentUserLoading,
    error: currentUserError,
  } = useQuery(GET_CURRENT_USER, { variables: { id: userId } });
  if (currentUserLoading) {
    return <div>Loading....</div>;
  }
  if (currentUserError) {
    return <div>Error: {JSON.stringify(currentUserError)}</div>;
  }
  return <div>{JSON.stringify(currentUserData)}</div>;
};

export default UserStoryline;
