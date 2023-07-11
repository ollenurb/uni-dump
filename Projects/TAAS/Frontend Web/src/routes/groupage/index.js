import { graphQlQuery } from '../../api/util'
import { useAxios } from '../../hooks/useAxios'
import axios from '../../api/graphql'
import { useEffect } from 'preact/hooks'
import { useDispatch } from 'react-redux'
import { notifyError } from '../../store/actions/notify'

import MembersList from './components/memberlist'
import MeetingsTable from './components/meetingstable'

const GET_GROUP = `
query GetGroup($id: ID!) {
    groupById(id: $id) {
        owner { id },
        title,
        description,
        areaOfInterest,
        members {
            id,
            firstName,
            lastName
        },
        meetings {
            id,
            name,
            dateTime,
            location,
            type 
        }
    }
}`

const GroupPage = ({ id }) => {
    const [response, error] = useAxios({
        axiosInstance: axios,
        url: '/graphql',
        method: 'post',
        requestConfig: graphQlQuery(GET_GROUP, { id }),
    })

    const dispatch = useDispatch()
    useEffect(() => {
        if (error) {
            dispatch(notifyError(error))
        }
    }, [error])

    if (response && response.data) {
        const { title, areaOfInterest, description, owner, members, meetings } =
            response.data.groupById

        return (
            <div
                style="max-width: 1080px; width: 100%"
                className="my-5 card mx-md-auto mx-md-3 shadow p-4"
            >
                <h1 className="display-3 text-center">{title}</h1>
                <h1 className="display-6 text-primary text-center">{areaOfInterest}</h1>
                <hr />
                <div>
                    <h3>
                        <i className="fa-solid fa-pen me-2" />
                        Description
                    </h3>
                    <p className="fs-5">{description}</p>
                    <h3 className="my-3">
                        <i className="fa-solid fa-user-group me-2" />
                        Participants
                    </h3>
                    <div className="row row-cols-lg-4 row-cols-md-3 row-cols-sm-2 row-cols-1">
                        <MembersList owner={owner} members={members} />
                    </div>
                    <h3 className="my-3">
                        <i className="fa-solid fa-handshake me-2" />
                        Meetings
                    </h3>
                    <MeetingsTable meetings={meetings} />
                </div>
            </div>
        )
    }
}

export default GroupPage
