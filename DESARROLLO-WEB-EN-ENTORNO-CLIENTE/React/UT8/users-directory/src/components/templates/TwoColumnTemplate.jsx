// src/components/templates/TwoColumnTemplate.jsx
import './TwoColumnTemplate.css'

export default function TwoColumnTemplate({ title, left, right }) {
  return (
    <div className="two-col">
      <h1 className="two-col__title">{title}</h1>
      <aside className="two-col__left">{left}</aside>
      <section className="two-col__right">{right}</section>
    </div>
  )
}