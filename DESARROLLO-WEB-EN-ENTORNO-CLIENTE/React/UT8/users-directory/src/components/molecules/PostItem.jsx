// src/components/molecules/PostItem.jsx
import './PostItem.css'

export default function PostItem({ post }) {
  return (
    <li className="post-item">
      <h4 className="post-item__title">{post.title}</h4>
      <p className="post-item__body">{post.body}</p>
    </li>
  )
}