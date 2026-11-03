import { useState } from 'react'
import { questions as allQuestions } from '@/data/questions'
import { buildQuiz } from '@/utils/buildQuiz'
import StartScreen from '@/components/organisms/StartScreen'
import QuestionCard from '@/components/organisms/QuestionCard'
import ScorePanel from '@/components/organisms/ScorePanel'
import ProgressBar from '@/components/atoms/ProgressBar'
import Button from '@/components/atoms/Button'
import './QuizPage.css'

const total = 5

export default function QuizPage() {
  const [phase, setPhase] = useState('start')
  const [questions, setQuestions] = useState(
    () => buildQuiz(allQuestions, total)
  )
  const [currentIndex, setCurrentIndex] = useState(0)
  const [userAnswers, setUserAnswers] = useState({})

  const question = questions[currentIndex]
  const selected = userAnswers[question.id] ?? null
  const locked = selected !== null
  const isLast = currentIndex === questions.length - 1

  // Count correct answers
  let score = 0

  for (const item of questions) {
    if (userAnswers[item.id] === item.correct) {
      score++
    }
  }

  function startGame() {
    // Reset the game
    setQuestions(buildQuiz(allQuestions, total))
    setCurrentIndex(0)
    setUserAnswers({})
    setPhase('playing')
  }

  function handleSelect(id, answer) {
    // Keep the first answer
    setUserAnswers((previous) => {
      if (previous[id] !== undefined) {
        return previous
      }

      return { ...previous, [id]: answer }
    })
  }

  function handleNext() {
    if (!locked) return

    if (isLast) {
      setPhase('finished')
    } else {
      setCurrentIndex(currentIndex + 1)
    }
  }

  let content

  if (phase === 'start') {
    content = <StartScreen total={total} onStart={startGame} />
  } else if (phase === 'finished') {
    content = (
      <ScorePanel
        score={score}
        total={questions.length}
        onPlayAgain={startGame}
      />
    )
  } else {
    content = (
      <>
        <ProgressBar
          value={currentIndex + 1}
          max={questions.length}
        />

        <QuestionCard
          key={question.id}
          question={question}
          selected={selected}
          locked={locked}
          onSelect={handleSelect}
        />

        <div className="quiz-page__actions">
          <Button onClick={handleNext} disabled={!locked}>
            {isLast ? 'Show result' : 'Next question'}
          </Button>
        </div>
      </>
    )
  }

  return (
    <main className="quiz-page">
      <h1 className="quiz-page__title">Web Dev Quiz</h1>
      {content}
    </main>
  )
}