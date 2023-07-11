import { useState, useEffect } from 'preact/hooks'

export const useAxios = (configObj) => {
    const { axiosInstance, method, url, requestConfig = {} } = configObj

    const [response, setResponse] = useState(null)
    const [error, setError] = useState('')
    const [loading, setLoading] = useState(false)

    useEffect(() => {
        const controller = new AbortController()

        const fetchData = async () => {
            try {
                setLoading(true)
                const res = await axiosInstance[method.toLowerCase()](url, {
                    ...requestConfig,
                    signal: controller.signal,
                })
                if (!res) {
                    throw Error('Undefined result')
                }

                // If GraphQl throws an error, it won't be coded into the HTTP header, so we need to check
                // manually from the response body and throw the error as needed
                if (res.data.errors) {
                    throw Error(res.data.errors[0].message)
                }
                setResponse(res.data)
            } catch (e) {
                setError(e.message)
            } finally {
                setLoading(false)
            }
        }

        fetchData()

        // cleanup
        return () => controller.abort()
    }, [])

    return [response, error, loading]
}
