import MeetingItem from "./meetingitem"

const MeetingsTable = ({ meetings }) => {
    if (meetings.length > 0) {
        return (
            <div className="table-responsive">
                <table className="table text-center">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Date</th>
                            <th scope="col">Location</th>
                            <th scope="col">Online / In person</th>
                        </tr>
                    </thead>
                    <tbody>
                        {meetings.map((m, idx) => (
                            <MeetingItem key={idx} {...m} />
                        ))}
                    </tbody>
                </table>
            </div>
        )
    }

    return (
        <div>
            <span className="fs-5">This group has no active meetings</span>
        </div>
    )
}

export default MeetingsTable
