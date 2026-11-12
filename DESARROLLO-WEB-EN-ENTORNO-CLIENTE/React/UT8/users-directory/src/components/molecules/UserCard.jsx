// src/components/molecules/UserCard.jsx
import Button from '../atoms/Button'
import './UserCard.css'

export default function UserCard({ user, selected, onSelect }) {
  return (
    <li className={`user-card ${selected ? 'user-card--selected' : ''}`}>
      <h3 className="user-card__name">{user.name}</h3>
      <p className="user-card__info">{user.email}</p>
      <p className="user-card__info">{user.company.name}</p>
      <Button onClick={() => onSelect(user)}>View posts</Button>
    </li>
  )
}