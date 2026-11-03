import QuestionHeader from '../molecules/QuestionHeader'
import AnswerOption from '../molecules/AnswerOption'
import './QuestionCard.css'

export default function QuestionCard({
  question,
  selected,
  locked,
  onSelect
}) {
  const titleId = `question-${question.id}`
  let feedback = ''

  // Show feedback after answering
  if (locked) {
    if (selected === question.correct) {
      feedback = 'Correct!'
    } else {
      feedback = 'The right answer was: ' + question.correct
    }
  }

  return (
    <fieldset
      className="question-card"
      disabled={locked}
      aria-labelledby={titleId}
    >
      <QuestionHeader
        id={titleId}
        category={question.category}
        difficulty={question.difficulty}
        text={question.text}
      />

      <div className="question-card__answers">
        {question.answers.map((answer) => {
          let status = 'idle'

          // Mark answers once the question is locked
          if (locked) {
            if (answer === question.correct) {
              status = 'correct'
            } else if (answer === selected) {
              status = 'wrong'
            }
          }

          return (
            <AnswerOption
              key={answer}
              name={`answer-${question.id}`}
              text={answer}
              checked={selected === answer}
              status={status}
              disabled={locked}
              onSelect={(text) => onSelect(question.id, text)}
            />
          )
        })}
      </div>

      <p className="question-card__feedback" role="status">
        {feedback}
      </p>
    </fieldset>
  )
}