import React from 'react';
import { connect } from 'react-redux';
import Sample from '../components/Sample';
import { getPost, getUsers } from '../modules/sample';

const { useEffect } = React;
const SampleContainer = ({
  getPost,
  getUsers,
  post,
  users,
  loadingPost,
  loadingUsers
}) => {
  // 클래스 형태 컴포넌트였다면 componentDidMount
  useEffect(() => {
    const fn = async () => {
      try {
        getPost(1);
        getUsers(1);
      } catch (error) {
        console.log(error);
      } 
    }
    fn();
  }, [getPost, getUsers])
  return (
    <Sample 
      post={post}
      users={users}
      loadingPost={loadingPost}
      loadingUsers={loadingUsers}
    />
  );
};

export default connect(
  ({sample, loading}) => ({
    post: sample.post,
    users: sample.users,
    // loadingPost: sample.loading.GET_POST,
    // loadingUsers: sample.loading.GET_USERS
    loadingPost: loading.GET_POST,
    loadingUsers: loading.GET_USERS
  }),
  { getPost, getUsers }
)(SampleContainer);