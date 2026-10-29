// src/components/atoms/Input.jsx
import './Input.css'

export default function Input({ value, onChange, placeholder }) {
  return (
    <input
      type="text"
      className="input"
      value={value}
      onChange={onChange}
      placeholder={placeholder}
    />
  )
}