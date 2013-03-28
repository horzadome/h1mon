h1mon
=====

A super-tiny set of scripts that send monitoring alerts to various services<br />
It's supposed to bridge the gap between applications which only know how to send notifications via email (firewall, raid controller, etc.)
and push message providers which deliberately throttle email pushing because they want you to use their API.
Simply deploy this, and point all your notifications to h1mon@localhost. 


Installation
-----
<pre>cd /opt
git clone git://github.com/horzadome/h1mon.git</pre>


Configuration
-----
At this time, only <a href="https://pushover.net/">Pushover</a> is supported.<br />
<ol>
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
