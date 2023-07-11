const TextInput = ({ labelText, valueState: [state, setState], ...props }) => (
    <div className="form-floating mb-3">
        <input
            id={props.id}
            className="form-control"
            placeholder // The "label" tag needs this property
            value={state}
            onInput={(e) => setState(e.target.value)}
            {...props}
        />
        <label for={props.id}>{labelText}</label>
    </div>
)

export default TextInput
