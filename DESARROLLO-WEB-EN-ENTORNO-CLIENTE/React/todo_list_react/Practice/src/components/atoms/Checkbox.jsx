// src/components/atoms/Checkbox.jsx
import './Checkbox.css'

export default function Checkbox({ checked, onChange, id }) {
  return (
    <input
      id={id}
      type="checkbox"
      className="checkbox"
      checked={checked}
      onChange={onChange}
    />
  )
}