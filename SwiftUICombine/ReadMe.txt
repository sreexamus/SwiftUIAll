1.Sink api returns subscriber(Anycancellable) which can be used to explicitly cancel the subscription
2. We use Anycancellable to make sure all the resources used by the subscriber are freed up after the object is de initialized.
