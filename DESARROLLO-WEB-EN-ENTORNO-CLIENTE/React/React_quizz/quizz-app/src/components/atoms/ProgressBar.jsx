import './ProgressBar.css'

export default function ProgressBar({ value, max }) {
  // Get the progress percentage
  const percentage = (value / max) * 100

  return (
    <div className="progress-bar">
      <div
        className="progress-bar__track"
        role="progressbar"
        aria-label="Quiz progress"
        aria-valuemin={0}
        aria-valuemax={max}
        aria-valuenow={value}
      >
        <div
          className="progress-bar__fill"
          style={{ width: percentage + '%' }}
        />
      </div>

      <p className="progress-bar__text"> Question {value} of {max} </p>
    </div>
  )
}