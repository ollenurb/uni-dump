import { useState } from 'preact/hooks'

export const useAxiosFunction = () => {
    const [error, setError] = useState('')
    const [loading, setLoading] = useState(false)
    const [response, setResponse] = useState(null)

    const axiosFetch = async (configObj) => {
        const { axiosInstance, method, url, requestConfig = {} } = configObj

        setError('')
        setLoading(false)
        setResponse(null)

        try {
            setLoading(true)
            const res = await axiosInstance[method.toLowerCase()](url, { ...requestConfig })
            console.log(res)
            setResponse(res.data)
        } catch (e) {
            // console.warn(e.message);
            if (e.response) {
                setError(e.response.data.error.message)
            } else if (e.request) {
                setError(e.request.message)
            } else {
                setError(e.message)
            }
        } finally {
            setLoading(false)
        }
    }

    return [response, error, loading, axiosFetch]
}
