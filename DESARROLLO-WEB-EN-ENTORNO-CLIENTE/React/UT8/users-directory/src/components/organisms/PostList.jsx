// src/components/organisms/PostList.jsx (refactored)
import useFetch from '../../hooks/useFetch'
import PostItem from '../molecules/PostItem'
import Spinner from '../atoms/Spinner'
import ErrorMessage from '../atoms/ErrorMessage'
import './PostList.css'

export default function PostList({ userId }) {
  const { data: posts, loading, error } = useFetch(
    `https://jsonplaceholder.typicode.com/users/${userId}/posts`
  )

  if (loading) return <Spinner label="Loading posts..." />
  if (error) return <ErrorMessage message={error} />

  return (
    <ul className="post-list">
      {posts.map((post) => <PostItem key={post.id} post={post} />)}
    </ul>
  )
}