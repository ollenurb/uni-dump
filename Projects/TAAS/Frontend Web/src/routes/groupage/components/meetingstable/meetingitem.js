const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

const TypeIcon = ({ type }) => {
    if (type == 'ONLINE') {
        return <i className="fa-solid fa-computer" />
    }

    return <i className="fa-solid fa-people-group" />
}

const MeetingItem = ({ name, type, location, dateTime }) => {
    let formattedDate = 'Not Specified'

    if (dateTime) {
        const date = new Date(dateTime * 1000)
        formattedDate = `${date.getDay()} ${
            months[date.getMonth()]
        } at ${date.getHours()}:${date.getMinutes()}`
    }

    return (
        <tr>
            <th scope="row text-start">{name}</th>
            <td>{formattedDate}</td>
            <td>{location}</td>
            <td>
                <TypeIcon type={type} />
            </td>
        </tr>
    )
}

export default MeetingItem
