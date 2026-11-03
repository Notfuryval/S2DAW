import './AnswerOption.css'

export default function AnswerOption({
  name,
  text,
  checked,
  status,
  disabled,
  onSelect
}) {
  // Add the classes for this answer
  const classes = [
    'answer-option',
    checked && 'answer-option--selected',
    status === 'correct' && 'answer-option--correct',
    status === 'wrong' && 'answer-option--wrong',
    disabled && 'answer-option--disabled'
  ].filter(Boolean).join(' ')

  return (
    <label className={classes}>
      <input
        className="answer-option__input"
        type="radio"
        name={name}
        value={text}
        checked={checked}
        disabled={disabled}
        onChange={() => onSelect(text)}
      />

      <span className="answer-option__text">{text}</span>
    </label>
  )
}