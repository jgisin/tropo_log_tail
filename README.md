# Tropo Log Tailing
Tail your logs for Tropo applications

Simply type your Tropo username, followed by your Tropo password when prompted.

Use the --truncate option for shorter logs during development.

Currently, this program requires an active Tropo app, or you will receive a message saying "No new logs", indicating you have no active logs to trail. 

## Installation Instructions:

<pre><code>gem install tropo_tail</pre></code>

You can then run the program by typing:
<pre><code>tropo_tail</pre></code>
or
<pre><code>tropo_tail --truncate</pre></code> for shorter logs.
