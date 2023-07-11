const MembersList = ({ owner, members }) =>
    members.map(({ id, firstName, lastName }, idx) => (
        <div key={idx} className="col mb-2">
            <div className="card p-2 text-center bg-secondary">
                <div className="fs-5 text-white">
                    {owner.id == id && <i className="fa-solid fa-crown me-2 text-alert" />}
                    <span>{`${firstName}${lastName ? ` ${lastName}` : ''}`}</span>
                </div>
            </div>
        </div>
    ))

export default MembersList
