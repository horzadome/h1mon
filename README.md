h1mon
=====

A super-tiny set of scripts that send monitoring alerts to various services


Installation
-----
<pre>cd /opt
git clone git://github.com/horzadome/h1mon.git</pre>


Configuration
-----
At this time, only <a href="https://pushover.net/">Pushover</a> is supported.<br />
<ol>To send notifications via Pushover:
<li>login to your Pushover account</li>
<li>go to <a href="https://pushover.net/apps/">Applications & Plugins</a> and create a new application</li>
<li>Open file /opt/h1mon/ingress.pl and modify these 2 parameters to match your Pushover account:
<pre>
  "token" => "YOUR PUSHOVER APP TOKEN",
  "user" => "YOUR PUSHOVER USER KEY",
</pre></li>
<li>Add this line to /etc/aliases :
    <pre>h1mon:          | /opt/h1mon/ingress.pl</pre>
<li>Configure your application (firewall or malware scanner) to send notifications to email address "h1mon@localhost"</li>
</ol>
