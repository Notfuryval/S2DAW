import { useState } from 'react'
import TwoColumnTemplate from '../templates/TwoColumnTemplate'
import UserList from '../organisms/UserList'
import PostList from '../organisms/PostList'
import Spinner from '../atoms/Spinner'
import ErrorMessage from '../atoms/ErrorMessage'
import useFetch from '../../hooks/useFetch'

export default function UsersPage() {
  const { data: users, loading, error } = useFetch(
    'https://jsonplaceholder.typicode.com/users'
  )
  const [selectedUser, setSelectedUser] = useState(null)

  if (loading) return <Spinner />
  if (error) return <ErrorMessage message={error} />

  return (
    <TwoColumnTemplate
      title="Users directory"
      left={
        <UserList
          users={users ?? []}
          selectedId={selectedUser?.id}
          onSelect={setSelectedUser}
        />
      }
      right={
        selectedUser ? (
          <>
            <h2>Posts by {selectedUser.name}</h2>
            <PostList userId={selectedUser.id} />
          </>
        ) : (
          <p>Select a user to see their posts.</p>
        )
      }
    />
  )
}