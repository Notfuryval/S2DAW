import Button from '../atoms/Button'
import './ScorePanel.css'

export default function ScorePanel({ score, total, onPlayAgain }) {
  // Choose the final message
  let message = 'Keep practising!'

  if (score === total) {
    message = 'Perfect! You got every answer right.'
  } else if (score >= total / 2) {
    message = 'Good job! You know your stuff.'
  }

  return (
    <section className="score-panel">
      <h2 className="score-panel__title">Final result</h2>

      <p className="score-panel__score">
        Your score: {score} / {total}
      </p>

      <p className="score-panel__message">{message}</p>

      <Button onClick={onPlayAgain}>Play again</Button>
    </section>
  )
}