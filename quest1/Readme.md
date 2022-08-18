We understand your time is precious, but as discussed, we ask each applicant to take on our
small challenges. There is no right or wrong approach and we&#39;re certainly not expecting war and
peace ��. We would expect no more than 30 minutes per challenge, if at the end of the time
you haven’t completed don’t worry just send us what you have. (Uploaded to a public GIT
repository – ensuring there is nothing KPMG sensitive in the test below there is no need for
anything to be)
 
Challenge #1
A 3-tier environment is a common setup. Use a tool of your choosing/familiarity create these
resources. Please remember we will not be judged on the outcome but more focusing on the
approach, style and reproducibility.

Response:

I sent one mail as had one query on this quest. The query was regarding 3-tier environment, confusion was do i need to create dev, staging and prod or 3-tier architecture with presentation layer, Application layer and Data layer. Didn't received the response so thought to spin up infrastructure with various resources and also used variable.tf along with .tfvars file to showcase that if we just change .tfvar file then we can use it for dev, staging and prod. Showcased VM on a custom network and private IP enabled cloud sql to touch up with 3-tier architecture. 

Creates a custom network, a configurable VM based on custom network, a cloud sql db instance with private IP configured and a bucket.

My approach was to showcase four things:

1. Using Ist resource attribute to create another resource by calling first resource attribute in second module (cloud sql and custom network being in same module)
2. Using depends_on to showcase the dependency and presidency (will be found in root module(i.e. play_ground))
3. Bubbling up an attribute from one module (here from landing zone) and trickling down to other module (compute engine or CE module and root module i.e. play_ground) to create CE instance based on custom or private network.
4. one module can spin many resources without inter-dependability (bucket in landing zone).