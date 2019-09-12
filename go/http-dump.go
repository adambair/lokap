
	// ----
	// Dump/Inspect http request
	// https://medium.com/doing-things-right/pretty-printing-http-requests-in-golang-a918d5aaa000
	// update at bottom of article
	requestDump, err := httputil.DumpRequest(req, true)
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(string(requestDump))
	//----
