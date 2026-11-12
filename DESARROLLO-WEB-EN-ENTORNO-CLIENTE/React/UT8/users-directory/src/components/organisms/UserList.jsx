// src/components/organisms/UserList.jsx
import UserCard from '../molecules/UserCard'
import './UserList.css'

export default function UserList({ users, selectedId, onSelect }) {
  return (
    <ul className="user-list">
      {users.map((user) => (
        <UserCard
          key={user.id}
          user={user}
          selected={user.id === selectedId}
          onSelect={onSelect}
        />
      ))}
    </ul>
  )
}