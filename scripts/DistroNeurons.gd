extends Object


var a = 0.0
var input = 0.0
var cached_a =0.0
var inps = []
var inpWeights = []
var bias = 0.0
var eta = 0.1
var error = 0
var cached_errors = []

func forward():
	cached_a=bias+input
	
	if len(inps)>0:
		for i in range(len(inps)):
			cached_a+=inps[i].a*inpWeights[i]
		
	
	if cached_a < 0:
		cached_a*=0.5
			
	
func backprop():
	cached_errors = []
	error *= eta
	
	if a<0:
		error*=0.5
		
	bias -= error
	for i in range(len(inps)):
		inpWeights[i] += error*-1*inps[i].a
		cached_errors.append(-1*inpWeights[i]*error)
			

func decayWeights(decay=0.99):
	for i in range(len(inpWeights)):
		inpWeights[i] = decay*inpWeights[i]
	
func preUpdate():
	forward()
	backprop()
	
	
func postUpdate():
	a = cached_a
	for i in range(len(inps)):
		inps[i].error=cached_errors[i]
		
	
	
	


