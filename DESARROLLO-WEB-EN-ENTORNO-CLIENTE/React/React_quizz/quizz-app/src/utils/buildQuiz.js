import { shuffle } from './shuffle'

export function buildQuiz(allQuestions, amount) {
  // Pick random questions
  const selected = shuffle(allQuestions).slice(0, amount)

  return selected.map((question) => {
    const answers = shuffle([
      question.correct,
      ...question.incorrect
    ])

    return {
      id: question.id,
      category: question.category,
      difficulty: question.difficulty,
      text: question.text,
      correct: question.correct,
      answers: answers
    }
  })
}