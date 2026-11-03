import Button from '../atoms/Button'
import './StartScreen.css'

export default function StartScreen({ total, onStart }) {
  return (
    <section className="start-screen">
      <h2 className="start-screen__title">
        How much do you know about web development?
      </h2>

      <p className="start-screen__text">
        Answer {total} random questions and see how many you get right.
      </p>

      <Button onClick={onStart}>Start quiz</Button>
    </section>
  )
}