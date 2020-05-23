## Download Pack

### Check Data File Size
Severity: `0`
Version: `1` 

Tags: `Building Block` | `Data/Log File` 

Verifies that a data file is at least 5120MB.
 
This condition is used to build other conditions. It should not be
enabled or have associated actions.


### Check Error Log Size
Severity: `0`
Version: `2` 

Tags: `Building Block` | `Data/Log File` 

Checks the size of the error log.
 
This condition is used in other custom conditions that query the error
log to prevent performance issues associated with larger log files. It
should not be enabled or have associated actions.


### Check Transaction Log File Size
Severity: `0`
Version: `1` 

Tags: `Building Block` | `Data/Log File` 

Verifies that the transaction log file is at least 1024MB.
 
This condition is used to build other conditions. It should not be
enabled or have associated actions.


### 'Common Criteria Compliance' Enabled
Severity: `2`
Version: `7` 

Tags: `Auditing` 

Queries sys.configurations to detect when Common Criteria Compliance has
been enabled and will be activated on server restart.
 
Common Criteria Compliance is an advanced option in SQL Server
Enterprise and Datacenter editions that can have a dramatic impact on
server performance. The value field indicates that the setting is
enabled; however, the value\_in\_use field indicates whether it has been
activated. Activating Common Criteria Compliance requires a server
restart.
 
See Also:
<https://msdn.microsoft.com/en-us/library/bb326650.aspx>


### 'Cost Threshold of Parallelism' Changed
Severity: `1`
Version: `3` 

Tags: `Auditing` | `Performance` 

Queries sys.configurations to detect whenever the server-wide Cost
Threshold of Parallelism configuration setting changes on a monitored
server, by comparing the last value retrieved to the current value.


### CPU Schedulers Failed to Create Worker
Severity: `1`
Version: `1` 

Tags: `CPU` | `Memory` | `Performance` 

This condition evaluates to True when there are schedulers that could
not create a new worker, most likely due to memory constraints.
 
See Also:
<https://msdn.microsoft.com/en-us/library/ms177526.aspx>


### CPU Schedulers Hot Added
Severity: `1`
Version: `3` 

Tags: `CPU` | `Performance` 

This condition evaluates to True when there are schedulers that have
been added due to a hot add CPU event.
 
See Also:
<https://msdn.microsoft.com/en-us/library/ms177526.aspx>


### CPU Schedulers Visible Offline Status
Severity: `1`
Version: `5` 

Tags: `CPU` | `Performance` | `UpdateForPublish` | `11.2.3` 

This condition evaluates to True when there are CPU cores that are
visible to SQL Server, but are offline.
 
SQL Server licensing might prevent a server from using all available
cores. Not only can this limit performance, but it can cause additional
harm by unbalancing NUMA nodes.
 
See Also:
<http://www.sqlskills.com/blogs/glenn/balancing-your-available-sql-server-core-licenses-evenly-across-numa-nodes/>
 
<https://sqlperformance.com/2012/11/system-configuration/2012-cal-problems>


### CPU Unused Schedulers
Severity: `1`
Version: `3` 

Tags: `CPU` | `Performance` | `UpdateForPublish` | `11.2.3` 

This condition evaluates to True when CPU schedulers are disabled
(is\_online = 0).
 
This indicates that a CPU is offline and SQL Server cannot use it for
processing (e.g. queries, batches, etc.).  A disabled CPU could be
caused by affinity masking or licensing issues, and can impact
performance.
 
See the CPU Schedulers Visible Offline Status condition for additional
information.


### Data File Growth
Severity: `0`
Version: `21` 

Tags: `Auto-growth` | `Data/Log File` 

This condition evaluates to True if any data file (\>=5GB) is larger
than it was during the last evaluation of this condition.


### Data File Shrink
Severity: `0`
Version: `3` 

Tags: `Data/Log File` | `Auditing` 

Evaluates to True if any data file is smaller than it was during the
last evaluation of this condition. Shrinking data files is rarely
recommended.
 
See Also:
<http://www.sqlskills.com/blogs/paul/why-you-should-not-shrink-your-data-files/>


### Database Files Count Change
Severity: `1`
Version: `4` 

Tags: `Auditing` | `Data/Log File` 

This condition will evaluate to True when the number of database files
changes.
 
Checks the count of database files in master.sys.master\_files,
regardless of file type (e.g. ROWS, LOG, etc.)
 
A highlight will appear on the Backups chart of the dashboard to show
that backup jobs might need to be created or removed depending on the
scenario.


### Foreign Keys Not Trusted
Severity: `1`
Version: `17` 

Tags: `Performance` 

This condition evaluates to True when it finds
sys.foreign\_keys.is\_not\_trusted values on objects that it expects to
be trusted.
 
When foreign keys are not trusted, SQL Server may not be able to use
them for query plans and optimization, affecting the performance of your
queries. Foreign keys that were disabled, perhaps for bulk loading of
data, and then enabled, may not be trusted.  The table must be altered
for those Foreign Keys to be trusted again.
 
See Also:
<http://blogs.sqlsentry.com/melissaconnors/does-your-database-have-trust-issues>


### High Active User Sessions
Severity: `0`
Version: `8` 

Tags: `Performance` 

This condition will be triggered if the count of user sessions with
recent activity goes over a specified threshold.
 
High active sessions by itself does not universally correlate with
performance or other problems, but on some systems it can precede an
overload state, and/or be an indicator of malicious denial of service
(DoS) activity. As such, this condition should be enabled selectively
and the threshold adjusted appropriately.


### High Ad Hoc Query Plans
Severity: `1`
Version: `8` 

Tags: `Memory` | `Performance` | `UpdateForPublish` | `11.2.3` 

This condition checks for plan cache bloat that may be alleviated by
enabling 'optimize for ad hoc workloads'.
 
If 'optimize for ad hoc workloads' is false, a high percentage of plan
cache is dedicated to single use plans, and page life expectancy is low,
then this condition will evaluate to True.
 
A high percentage of plan cache in this condition is defined as \>10%
when the server has less than or equal to 64 GB of memory and \>5% when
it has greater than 64 GB of memory.
 
See Also:
<http://www.sqlskills.com/blogs/kimberly/plan-cache-and-optimizing-for-adhoc-workloads/>


### High Average Work Queue Count
Severity: `1`
Version: `0` 

Tags: `CPU` | `Performance` 

This condition evaluates to True when
sys.dm\_os\_schedulers.work\_queue\_count has an average value greater
than 1.
 
A high average work queue count can indicate that max worker threads for
the server should be increased.
 
See Also:
<https://blogs.msdn.microsoft.com/sqlsakthi/2011/03/13/max-worker-threads-and-when-you-should-change-it/>


### High Avg Wait Time per User Session
Severity: `1`
Version: `3` 

Tags: `Performance` | `Waits` | `30SecEval` 

Wait time measures how long queries are waiting for CPU, disk, memory,
or other resources, across all sessions. High avg wait time per second
by itself may not be indicative of a problem though, because it doesn't
consider the activity level of the system. For example, 5,000ms of avg
wait time/sec would be poor on a system with only 30 active users, but
excellent on a system with 3,000 active users.
 
For this reason, this condition divides avg wait time/sec (Total) by the
number of active user sessions to calculate the avg wait time per
session. If this value is over 50ms users may be experiencing noticeable
delays.
 
This value should not be considered a universal hard threshold, but more
of a guideline, and may need to be adjusted for different systems. Note
that SQL Sentry filters out innocuous waits, so the wait time used here
will be lower than if collected directly from SQL Server, and more
accurately reflects user-impacting waits.
 
See Also:
<http://www.sqlskills.com/blogs/paul/wait-statistics-or-please-tell-me-where-it-hurts/>
<http://www.sqlperformance.com/category/waits-2>


### High Compiles + High CPU
Severity: `1`
Version: `18` 

Tags: `Performance` | `CPU` | `SIOSIQ` 

Query plan compiles can be a CPU-intensive operation. If total CPU is
high for an extended period and compiles are also high, they may be
causing or at least contributing to the high CPU.
 
See the High Compiles conditions for more details on troubleshooting the
issue.


### High Compiles
Severity: `0`
Version: `4` 

Tags: `Performance` | `CPU` | `UpdateForPublish` | `11.2.3` 

Query plan compiles should generally be \<15% of batches per
second. Higher values indicate plan reuse is low, and will often
correlate with high CPU, since plan compilation can be a CPU-intensive
operation. High compiles may correlate with low plan cache hit ratios,
and can be an indicator of memory pressure, since there may not be
enough room to keep all plans in cache.  
  
If you see consistently high compiles, run a [Quick
Trace](https://www.sentryone.com/help/ug/#PA_QuickTraces.html) and sort
the results by Cache Misses, then expand details to view actual
compiling statements (SP:CacheMiss events, highlighted) along with the
reason (SubClass) and procedure (Object).
  
See Also:  
<http://technet.microsoft.com/en-us/library/cc966425.aspx>
  
<http://technet.microsoft.com/en-us/library/cc293623.aspx>


### High Context Switches - Warning
Severity: `1`
Version: `5` 

Tags: `Performance` | `CPU` 

Context switches represent the combined rate at which all processors on
the computer are switched from one thread to another. Consistently high
values over 5,000 per logical processory can mean that the server is
spending too much time switching threads instead of actively running
threads.


### High Context Switches
Severity: `2`
Version: `4` 

Tags: `Performance` | `CPU` 

Context switches represent the combined rate at which all processors on
the computer are switched from one thread to another. Consistently high
values over 7,500 per logical processor can mean that the server is
spending too much time switching threads instead of actively running
threads.


### High CPU - Warning
Severity: `0`
Version: `3` 

Tags: `Performance` | `CPU` 

Sustained CPU utilization greater than 90% may indicate a CPU
bottleneck.
 
Use the Peformance Advisor for Windows Processes tab to ascertain the
processes causing the high CPU. On dedicated SQL Server machines most
CPU should be associated with the SQL Server process(es). If SQL Server
is causing the high CPU, use Top SQL and/or QuickTrace to determine
which sessions and queries are consuming the most CPU.
 
NOTE: If you launch QuickTrace by highlighting a range on the CPU Usage
chart, the results will be pre-sorted by CPU % descending, so the
greatest consumers will be on top.


### High CPU for non-SQL Server process
Severity: `1`
Version: `9` 

Tags: `Performance` | `CPU` 

On dedicated SQL Servers most of the CPU utilization should generally be
related to the SQL Server process (sqlservr.exe). This condition will
detect when CPU utilization is high, and at least 25% is related to some
process other than SQL Server.


### High CPU For Single Core
Severity: `1`
Version: `4` 

Tags: `CPU` 

Sustained CPU utilization greater than 90% on a single core may indicate
a CPU bottleneck. The CPU Total usage value is checked against
100/Number of cores used by the SQL Server instance.
 
Use the Performance Advisor for Windows Processes tab to ascertain the
processes causing the high CPU. On dedicated SQL Server machines most
CPU should be associated with the SQL Server process(es). If SQL Server
is causing the high CPU, use Top SQL and/or QuickTrace to determine
which sessions and queries are consuming the most CPU.
 
NOTE: If you launch QuickTrace by highlighting a range on the CPU Usage
chart, the results will be pre-sorted by CPU % descending, so the
greatest consumers will be on top.


### High CPU Signal Waits
Severity: `1`
Version: `1` 

Tags: `CPU` | `Waits` 

This condition evaluates to True when total signal waits are above 20%.
 
High signal waits are often indicative of CPU pressure, but the
threshold may vary by system.
 
See Also:
<https://sqlserverperformance.wordpress.com/2010/04/13/a-dmv-a-day-%E2%80%93-day-14/>
 
<http://www.sqlsentry.com/white-papers/troubleshooting-sql-server-wait-stats>


### High CPU
Severity: `0`
Version: `1` 

Tags: `Performance` | `CPU` 

Sustained CPU utilization greater than 90% may indicate a CPU
bottleneck.
 
Use the Peformance Advisor for Windows Processes tab to ascertain the
processes causing the high CPU. On dedicated SQL Server machines most
CPU should be associated with the SQL Server process(es). If SQL Server
is causing the high CPU, use Top SQL and/or QuickTrace to determine
which sessions and queries are consuming the most CPU.
 
NOTE: If you launch QuickTrace by highlighting a range on the CPU Usage
chart, the results will be pre-sorted by CPU % descending, so the
greatest consumers will be on top.


### High Database Replica Send or Recovery Queue
Severity: `1`
Version: `2` 

Tags: `HA/DR` 

Large log send or recovery queues can be an indicator of a system or
network bottleneck. This condition will be triggered if either queue
goes over 3MB.
 
Use the Performance Advisor AlwaysOn Management interface and Dashboard
to troubleshoot.
 
See Also:
Building a High Availability and Disaster Recovery Solution by Using
AlwaysOn Availability Groups -
<http://msdn.microsoft.com/en-us/library/jj191711.aspx>


### High Disk Waits and Latency
Severity: `1`
Version: `3` 

Tags: `Performance` | `Disk` | `Waits` 

This condition will detect if high disk latency is potentially causing
high disk wait time in SQL Server.
 
To troubleshoot, view the Performance Advisor Disk Activity tab to
locate bottlenecks in the disk system or specific database files. On the
Dashboard, highlight a range with high latency and Jump To-\>Top SQL to
determine which queries may be contributing to and/or suffering from
high disk waits.
 
Disk latency is the only disk measurement for which there are generally
accepted ranges that represent good and bad performance from a SQL
Server perspective. The following ranges can be used as a general
guideline to determine whether disk latency is acceptable:  
  
Less than 10ms - Fast \*  
Between 10ms - 20ms - Acceptable  
Between 20ms - 50ms - Slow  
Greater than 50ms - Critical  
  
\* For transaction log writes, between 0ms and 2ms is desirable.


### High Mirroring Send or Redo Queue
Severity: `1`
Version: `1` 

Tags: `HA/DR` 

Large log send or redo queues can be an indicator of a system or network
bottleneck. This condition will be triggered if either queue goes over
3MB.
 
Use the Performance Advisor Dashboard to troubleshoot.


### High Number of Failed Logins
Severity: `2`
Version: `15` 

Tags: `Auditing` 

This condition evaluates to True when there are 10+ failed logins in the
last two minutes. The first query ensures that the error log is not more
than 2MB (for performance consideration) and the second query checks for
the number of failed logins.
 
A high number of failed login attempts may indicate that an unauthorized
user is trying to access the system. SQL Server Security properties must
have Login auditing enabled for this condition to function.
 
In SQL Server Management Studio go to Server Properties --\> Security
page to check on these settings. The Login auditing option must be set
to "Failed logins only" or "Both failed and successful logins".
 
See Also:
<https://msdn.microsoft.com/en-us/library/ms188470.aspx>


### High Pending Disk IO Count
Severity: `1`
Version: `1` 

Tags: `CPU` | `Performance` | `Disk` 

This condition evaluates to True when
sys.dm\_os\_schedulers.pending\_disk\_io\_count has an average value
greater than 0.
 
A high pending disk IO count may be indicative of an IO bottleneck.
 
See Also:
 
<https://msdn.microsoft.com/en-us/library/ms177526.aspx>
[](https://msdn.microsoft.com/en-us/library/ms177526.aspx)
<https://sqlserverperformance.wordpress.com/2010/03/08/easy-ways-to-detect-io-pressure-in-sql-server-2008/>
[](https://sqlserverperformance.wordpress.com/2010/03/08/easy-ways-to-detect-io-pressure-in-sql-server-2008/)


### 'High Performance' Power Plan not Enabled
Severity: `1`
Version: `7` 

Tags: `Auditing` | `Performance` | `CPU` 

If the High Performance power plan is not enabled, Windows may be
throttling CPU performance. This in turn can have a significant negative
impact on both Windows and SQL Server performance, so it is highly
recommended that a dedicated SQL Server always use the High Performance
plan.
 
This condition uses a WMI query to determine whether the High
Performance plan is active, and will evaluate to True if it is not.
 
Notes:
\- It is possible to use a custom power plan that does not throttle CPU,
although this is not a common practice.
\- If the WMI query returns the error, "The program is blocked by group
policy", it may mean that your network admin has applied a power plan
via group policy as described in the post below. If so, you should check
with them to ensure that the plan does not throttle CPU.
 
See Also:
Degraded overall performance on Windows Server 2008 R2 -
<http://support.microsoft.com/kb/2207548>
Ensuring Maximum CPU Performance via Group Policy -
<http://greg.blogs.sqlsentry.net/2011/01/ensuring-maximum-cpu-performance-via.html>


### High Recompiles
Severity: `0`
Version: `10` 

Tags: `Performance` | `CPU` | `UpdateForPublish` | `11.2.3` 

Query plan recompiles should generally be \<15% of initial compiles, and
will often correlate with high CPU, since plan compilation can be a
CPU-intensive operation. They may be caused by statistics updates,
schema changes, etc., and may correlate with low plan cache hit ratios.
  
If you see consistently high recompiles, run a [Quick
Trace](https://sentryone.com/help/ug/PA_QuickTraces.html) and sort the
results by Recompiles, then expand details to view actual recompiling
statements (SP:Recompile events, highlighted) along with the reason
(SubClass) and procedure (Object).  
  
See Also:  
<http://technet.microsoft.com/en-us/library/cc966425.aspx>
  
<http://technet.microsoft.com/en-us/library/cc293623.aspx>


### High Redo Completion Time
Severity: `1`
Version: `12` 

Tags: `HA/DR` 

This condition divides the 'log\_send\_rate' and 'redo\_rate' values
found in the sys.dm\_hadr\_database\_replica\_states DMV to determine
the average redo completion time.
 
Log Send Rate is the rate at which the logs are being sent to secondary
databases in an availability group, and Redo Rate is the rate in which
the log records are being redone on the secondary databases.
 
By default, this condition will evaluate to True if the average redo
completion time is greater than 5 mins (in secs). In addition, please
note that this condition is designed to return rows only when it is
executed against the primary replica.
 
See Also:
<http://sqlperformance.com/2015/08/monitoring/availability-group-replica-sync>


### High Runnable Tasks Count
Severity: `1`
Version: `1` 

Tags: `CPU` | `Performance` 

This condition evaluates to True when
sys.dm\_os\_schedulers.runnable\_tasks\_count has an average value
greater than 10.
 
A high runnable tasks count is indicative of CPU pressure.
 
See Also:
<https://sqlserverperformance.wordpress.com/2010/04/08/a-dmv-a-day-%E2%80%93-day-9/>


### High VLF Count
Severity: `0`
Version: `0` 

Tags: `Auditing` | `Disk` 

SQL Server database transaction logs contain multiple virtual log files,
or VLFs. The number of VLFs is dictated by the initial size and
auto-growth size for the transaction log. Too many VLFs can lead to
increased backup/recovery times and possible performance problems.
 
See the Performance Advisor Disk Space tab for VLF counts for all log
files, as well as configured auto-growth size and how many VLFs will
result from each auto-growth.
 
If VLFs are too high, the count can be reset by shrinking and resizing
the log. See the "8 Steps" article below for more details and scripts.
 
See Also:
<http://www.sqlskills.com/blogs/kimberly/transaction-log-vlfs-too-many-or-too-few/>
<http://www.sqlskills.com/blogs/kimberly/8-steps-to-better-transaction-log-throughput/>


### Hyper-V High vCPU Wait Time
Severity: `2`
Version: `3` 

Tags: `Hyper-V` | `Virtualization` 

The vCPU Wait Time is a SQL Sentry virtual counter. It is calculated by
multiplying CPU wait time per dispatch (the average time, in
nanoseconds, spent waiting for a virtual processor to be dispatched onto
a logical processor) by the number of dispatches per second onto the
logical processor.


### Incorrect Compatibility Level
Severity: `1`
Version: `5` 

Tags: `Auditing` | `UpdateForPublish` | `11.2.3` 

This condition evaluates to True when a database in the SentryOne
repository has a compatibility level that does not match that of the
Master database (current compatibility level).
 
Compatibility mode allows an older database to run on a newer version of
SQL Server at the expense of not being able to run newer features.
 While some databases need to use an older compatibility mode, not all
of them do.
 
If there are databases, which must run in compatibility mode, please
make provisions to exclude them in order to reduce false positive
values.


### Large Windows File Cache
Severity: `1`
Version: `1` 

Tags: `Performance` | `Memory` 

The Windows file (or system) cache stores in memory file data that is
read from or written to disk. Since SQL Server manages its own memory,
this cache will typically not grow large on a dedicated SQL Server.
However, if some other process is causing it to grow large unexpectedly
it can lead to memory pressure for SQL Server.
 
In the case of Analysis Services, database files may be loaded into and
served from the Windows file cache, even if the associated file data
doesn't exist in the SSAS internal caches. For this reason, monitoring
the file cache is important to ensure that physical memory is being used
effectively, and that memory contention doesn't occur between the SSAS
process, the file cache, and other processes on the server, including
SQL Server.


### Log File Growth
Severity: `0`
Version: `13` 

Tags: `Auto-growth` | `Data/Log File` 

This conditions evaluates to True if any transaction log, of at least
1024MB in size, is larger than it was during the last evaluation of this
condition.
 
Frequent log file growth can lead to the creation of too many Virtual
Log Files (VLFs). You can prevent this by optimizing the initial size
and auto-growth size for the transaction log.
 
See the High VLF Count custom condition for more information.


### Long Running Open Transactions
Severity: `1`
Version: `6` 

Tags: `Performance` | `UpdateForPublish` | `11.2.3` 

This condition evaluates to True if any running transactions have been
open for at least 90 seconds. The query returns a list containing the
query text and value (in seconds) of the longest running open
transactions.
 
This is a modified version of a query in Paul Randal's blog:
<http://www.sqlskills.com/blogs/paul/script-open-transactions-with-text-and-plans/>


### Low Available Windows Memory
Severity: `2`
Version: `1` 

Tags: `Performance` | `Memory` 

Most Windows servers require at least 100MB of available memory at all
times to ensure proper function, and avoid expensive disk paging
operations. This condition will alert if available memory drops below
this threshold.


### Low Page Life Expectancy
Severity: `1`
Version: `6` 

Tags: `Performance` | `Memory` 

Page Life Expectancy (PLE) is the average lifespan in seconds of a data
page in buffer, and is one of the best indicators of memory pressure. In
general, the larger the buffer cache size, the higher it should be.
 
The formula\* used in this condition takes the size of the buffer pool
into account when determining whether the current PLE value is
problematic:
 
PLE \< (DataCacheSizeInGB/4GB \* 300)
 
Each NUMA node has its own PLE value, so some nodes may be suffering
from memory pressure while others are not. This condition checks all
NUMA nodes via the Any instance, which automatically iterates all nodes
and applies the formula in a synchronized fashion across all counters.
 
The first check in the condition ensures that the buffer size is at
least 2GB (default) before processing the formula, to avoid false
positives caused by small buffers.
 
See Also:
<http://www.sqlskills.com/blogs/jonathan/finding-what-queries-in-the-plan-cache-use-a-specific-index/>
<http://www.sqlskills.com/blogs/paul/page-life-expectancy-isnt-what-you-think/>
 
\* Formula created by Jonathan Kehayias (MVP/MCM)


### Network Bottleneck - Outbound
Severity: `2`
Version: `1` 

Tags: `Performance` | `Network` 

The Output Queue Length is the size of the network output packet queue,
in packets. A sustained value of \>3 may indicate a network bottleneck.
This condition will detect a queue length \>3 on any network adapter.


### NUMA Disabled
Severity: `1`
Version: `1` 

Tags: `CPU` | `Performance` | `Auditing` 

This condition evaluates to True when NUMA is disabled.
 
See Also:
<https://sqlserverperformance.wordpress.com/2010/04/08/a-dmv-a-day-%E2%80%93-day-9/>


### 'Optimize for Ad hoc Workloads' Changed
Severity: `0`
Version: `6` 

Tags: `Auditing` 

Detects whenever the Optimize for Ad hoc Workloads server config setting
changes, by comparing the last value retrieved to the current value.


### Page Verification Check
Severity: `1`
Version: `8` 

Tags: `Auditing` | `UpdateForPublish` | `11.2.3` 

This condition evaluates to True when it locates databases in the
SentryOne repository with an inadequate level of page protection.
 
From release 2005 databases should be using Checksum. Databases upgraded
or scripted from an earlier version may still be using torn protection.
 
The result set format is as follows: Key (server name: (Database), value
(1 if incorrect)).
 
See Also:
<https://msdn.microsoft.com/en-GB/library/bb522682.aspx>
 
To change a single database on a server run the following code after
changing the database name:
USE \[master\]
GO
ALTER DATABASE \[AdventureWorks\] SET PAGE\_VERIFY CHECKSUM  WITH
NO\_WAIT;
GO
 
To change all databases on a server run the following code:
SELECT N'ALTER DATABASE \[' + db.name + N'\] SET PAGE\_VERIFY CHECKSUM
 WITH NO\_WAIT;'
FROM sys.databases AS db
WHERE db.page\_verify\_option\_desc \<\> N'CHECKSUM';


### SentryOne Monitoring Service Offline
Severity: `2`
Version: `6` 

Tags: `Auditing` | `UpdateForPublish` | `11.2.3` 

Returns the SentryOne Monitoring Service that's been offline the longest
in any site with actively watched connections.  This condition only
works when two or more monitoring services are used.
 
To avoid triggering this condition when intentionally stopping a
service, you can temporarily move it into a site with no watched
connections using Site Configuration.


### Server MAXDOP changed
Severity: `0`
Version: `8` 

Tags: `Auditing` 

Detects whenever the server-wide max degree of parallelism (MAXDOP)
server config setting changes on a server with more than one processor,
by comparing the last value retrieved to the current value.


### Service Broker - Activation Errors Occurred
Severity: `1`
Version: `8` 

Tags: `Service Broker` | `11.2.3` 

This condition evaluates to True when Service Broker procedures have
exited due to error.
 
See Also:
<https://msdn.microsoft.com/en-us/library/ms191266.aspx>
 
<https://technet.microsoft.com/en-us/library/bb522922(v=sql.105).aspx>
 
<https://msdn.microsoft.com/en-us/library/ms166102(v=sql.90).aspx>


### Service Broker - Login Connection Error
Severity: `1`
Version: `2` 

Tags: `Service Broker` | `11.2.3` 

This condition evaluates to True when a Service Broker network
connection has an error status.
 
A login\_state of 13 indicates that an error has occurred in a broker
connection. This condition returns the connection ID(s) of any rows with
a connection error state.
 
See Also:
<https://msdn.microsoft.com/en-us/library/ms189490.aspx>


### Service Broker - 'Poison Message Handling' Disabled
Severity: `1`
Version: `3` 

Tags: `Service Broker` | `11.2.3` 

This condition evaluates to True when 'Poison Message Handling' is
disabled.
 
A poison message is one that results in an error and a receiving
transaction rollback, which can cause an infinite loop situation.
 Service Broker defaults to disabling the queue after this happens 5
times in a row to prevent the endless loop scenario.  It is recommended
that is\_poison\_message\_handling\_enabled is True.
 
See Also:
<https://msdn.microsoft.com/en-us/library/bb522893.aspx>
 
<http://www.sqlskills.com/blogs/bobb/service-brokers-new-poison-message-handling/>
 
<http://colleenmorrow.com/2016/04/19/sql-server-service-broker-error-handling/>


### Service Broker - Queues with Issues
Severity: `1`
Version: `3` 

Tags: `Service Broker` | `11.2.3` 

This condition evaluates to True when service queues have an activation
procedure, but activation, receive, or enqueue is disabled.  The queue
name is returned in the list of results.
 
See Also:
<https://msdn.microsoft.com/en-us/library/ms187795.aspx>
 
<http://rusanu.com/2008/08/03/understanding-queue-monitors/>


### Service Broker - Task Limit Reached / Sec
Severity: `1`
Version: `3` 

Tags: `Service Broker` | `11.2.3` 

This condition evaluates to True when the Task Limit Reached/sec Total
counter is \>= 1.
 
This is the number of times per second that a queue monitor was unable
to start a new task due to hitting the defined task limit. The task
limit is defined via the 'MAX\_QUEUE\_READERS' parameter.
 
See Also:
<https://technet.microsoft.com/en-us/library/dd576261(v=sql.100).aspx>
 
<https://docs.microsoft.com/en-us/sql/relational-databases/performance-monitor/sql-server-broker-activation-object>


### Service Broker - Transmission Queue Errors
Severity: `1`
Version: `4` 

Tags: `Service Broker` | `11.2.3` 

This condition evaluates to True when an error message exists in the
transmission queue.
 
For additional information on the error, check the
sys.transmission\_queue transmission\_status to understand why the
message failed. The sys.transmission\_queue catalog view contains
details of the to/from service name, broker instance, message body, and
more.
 
See Also:
<https://msdn.microsoft.com/en-us/library/ms190336.aspx>
 
<https://msdn.microsoft.com/en-us/library/ms166044(v=sql.90).aspx>
 
<https://docs.microsoft.com/en-us/sql/tools/ssbdiagnose/ssbdiagnose-utility-service-broker>


### Sleeping Sessions with Old Open Transactions
Severity: `1`
Version: `9` 

Tags: `Performance` 

Detects when there are sleeping sessions with open transactions older
than 10 minutes by default. Such sessions can cause blocking, and can
prevent the transaction log from clearing, leading to excessive log file
growth and space exhaustion. Additionally, when snapshot isolation is
used, they can prevent version cleanup from occurring in tempdb.
 
The start time, session\_id, host, application and database are returned
for the oldest 5 transactions by default. The query itself only returns
transactions older than 5 minutes by default, to avoid bringing back
unnecessary results on systems with many short-running transactions.


### SQL File Auto-growth Disabled
Severity: `1`
Version: `7` 

Tags: `Auditing` | `Disk` | `UpdateForPublish` | `11.2.3` 

This condition queries the SentryOne database to dectect when
auto-growth has been disabled for any data or transaction log file.
 
Although auto-growth should be considered a contingency for unexpected
file growth vs. the primary means of managing growth, disabling it can
lead to eventual free space exhaustion, which will halt all DML
activity.
 
See Also:
<https://support.microsoft.com/en-us/kb/315512>


### SQL File Auto-growth Exceeds Free Space
Severity: `2`
Version: `6` 

Tags: `Disk` | `UpdateForPublish` | `11.2.3` 

Queries the SentryOne database to detect when the next auto-growth will
exceed either available free disk space or the max file size. The key
column represents the server and file name, and the value column
represents the "space debt" in MB.
 
The "space debt" is the minimum of the free space
(PerformanceAnalysisDeviceLogicalDisk.FreeSpace) minus the growth size
setting (PerformanceAnalysisSqlFile.Growth) or the maximum size
(PerformanceAnalysisSqlFile.MaxSize) minus the current size plus growth
size.


### SQL Server Memory Exhaustion
Severity: `3`
Version: `2` 

Tags: `Performance` | `Memory` | `Waits` 

Memory Grants Pending is the number of processes waiting for a query
workspace memory grant. Ideally this value should be 0 at all times, but
it can go above 0 in cases of severe memory pressure.
 
When it does, RESOURCE\_SEMAPHORE waits will typically also be \>0,
since this wait is a measure of the time that queries had to wait for
memory grants. This type will be visible in the Waits chart tooltips for
the Memory class and category.


### SQL Server Process Paged to Disk
Severity: `2`
Version: `1` 

Tags: `Performance` | `Memory` 

Under severe memory pressure Windows can page the SQL Server process to
disk, which can dramatically impact SQL Server performance. This custom
condition will query the ring buffer for the latest working set
utilization value for the SQL Server process, and alert if it drops
below 75%. If no record exists, 100(%) will be returned, which is the
optimal state.
 
By default the query only looks for resource monitor entries within the
past 2 hours. This is to prevent the condition from staying active
indefinitely if recovery values aren't logged after the process has been
returned to memory. This threshold can be modified as needed.
 
Note that if the Lock pages in memory user right has been assigned to
the SQL Server service user account, it will prevent Windows from paging
the SQL Server process.
 
See Also:
How to reduce paging of buffer pool memory in the 64-bit version of SQL
Server - <http://support.microsoft.com/kb/918483>
<http://sqlserverperformance.wordpress.com/2011/02/14/sql-server-and-the-lock-pages-in-memory-right-in-windows-server/>
<https://www.simple-talk.com/sql/database-administration/great-sql-server-debates-lock-pages-in-memory/>


### SQL Server Process Physical Memory Low
Severity: `1`
Version: `2` 

Tags: `Memory` | `Performance` 

This condition evaluates to True when
sys.dm\_os\_process\_memory.process\_physical\_memory\_low is true.
 
This indicates that the process is responding to low physical memory.
 
See Also:
<https://msdn.microsoft.com/en-us/library/bb510747.aspx>


### SQL Server Process Virtual Memory Low
Severity: `1`
Version: `3` 

Tags: `Memory` | `Performance` 

This condition evaluates to True when
sys.dm\_os\_process\_memory.process\_virtual\_memory\_low is true.
 
This indicates that more virtual memory is needed for the SQL Server
process.
 
See Also:
<https://msdn.microsoft.com/en-us/library/bb510747.aspx>


### Suspect Pages - Active Corrupt Pages
Severity: `3`
Version: `3` 

Tags: `Auditing` | `UpdateForPublish` | `11.2.3` 

This condition queries the dbo.suspect\_pages table located in the MSDB
database. If there are any pages with a status of 1, 2, or 3 then it
will evaluate to True, advising that there is potential corruption in
databases on the server being queried.
 
See Also:
<https://blogs.sentryone.com/johnmartin/monitoring-for-suspect-pages/>


### Suspect Pages - High Row Count
Severity: `1`
Version: `3` 

Tags: `Auditing` | `UpdateForPublish` | `11.2.3` 

This condition counts the number of rows present in the
dbo.suspect\_pages table in the MSDB database. When the total count of
rows in the table is greater than or equal to 900, it will evaluate to
True. This is because the dbo.suspect\_pages table is only allowed a
maximum of 1,000 rows before it fills, at which point any new suspect
pages that are detected will not have information logged about them.
 
See Also:
<https://blogs.sentryone.com/johnmartin/monitoring-for-suspect-pages/>


### Suspect Pages - Increase in Fixed Pages
Severity: `2`
Version: `2` 

Tags: `Auditing` 

This condition will query dbo.suspect\_pages in the MSDB database,
checking the number of fixed pages (event types 4, 5, and 7)
per-database. This condition will evaluate to True if the number of
fixed pages has increased since the last check.
 
If this condition is True, then it can mean that DBCC CHECKDB has
corrected or deallocated pages. Furthermore, if Enterprise Edition is in
use and the database is in either an Availability Group or Mirroring
session, it could indicate that pages were fixed via Automatic Page
Repair, alerting you to a potential corruption issue you might not have
otherwise observed.
 
See Also:
<https://blogs.sentryone.com/johnmartin/monitoring-for-suspect-pages/>


### Tempdb/CPU Configuration Warning > 8 CPUs
Severity: `1`
Version: `6` 

Tags: `Auditing` | `Performance` | `UpdateForPublish` | `11.2.3` 

If you have a large number of cores, you will generally set the number
of tempdb files as ¼ to ½ the number of cores. This condition will
verify that you have at least the ¼ ratio. This means if you have 32
cores and 8 files it will evaluate to False, but if there are more than
32 cores and only the 8 default tempdb files, then it will evaluate to
True.
 
The first query counts the visible online CPUs from
sys.dm\_os\_schedulers and the second query counts the number of tempdb
files from sys.master\_files.
 
You may wish to customize this based on contention or performance issues
you have seen in your environments. Keep in mind that Microsoft
recommends adding files in multiples of 4, so you would likely want to
go from 8 to 12, 16, 20, etc.
 
See Also:
<https://blogs.sentryone.com/aaronbertrand/sql-server-2016-tempdb-fixes/>
 
<http://www.sqlskills.com/blogs/paul/a-sql-server-dba-myth-a-day-1230-tempdb-should-always-have-one-data-file-per-processor-core/>


### Tempdb/CPU Configuration Warning
Severity: `1`
Version: `11` 

Tags: `Auditing` | `Performance` 

Checks that you have one tempdb file per CPU core, up to 8 files. As
with most SQL Server topics, an “it depends” caveat accompanies tempdb
recommendations, however, starting with SQL Server 2016, Microsoft
creates a default number of eight Tempdb files. It uses the number of
cores if there are fewer than eight cores or just one file it is SQL
Server Express.
 
The first query counts the visible online CPUs from
sys.dm\_os\_schedulers and the second query counts the number of tempdb
files from sys.master\_files.  This condition evaluates to True when the
count of CPUs is not equal to the count of tempdb files.
    
"As a general rule, if the number of logical processors is less than or
equal to 8, use the same number of data files as logical processors. If
the number of logical processors is greater than 8, use 8 data files and
then if contention continues, increase the number of data files by
multiples of 4 (up to the number of logical processors) until the
contention is reduced to acceptable levels or make changes to the
workload/code." (source:
 <https://support.microsoft.com/en-us/kb/2154845>)
 
See Also:
<https://msdn.microsoft.com/en-us/library/ms144259(v=sql.130).aspx>
<http://www.sqlskills.com/blogs/paul/a-sql-server-dba-myth-a-day-1230-tempdb-should-always-have-one-data-file-per-processor-core/>


### Tempdb Data Files
Severity: `1`
Version: `7` 

Tags: `Auditing` | `Performance` | `UpdateForPublish` | `11.2.3` 

This condition evaluates to True when there are more data files than
logical cores in use by SQL Server, or there are more than 4 logical
cores in use and fewer than 4 tempdb data files.
 
As a general rule, if the number of logical processors is \<= 8, use the
same number of data files as logical processors. If the number of
logical processors is \> 8, use 8 data files and then if contention
continues, increase the number of data files by multiples of 4 (up to
the number of logical processors) until the contention is reduced to
acceptable levels or make changes to the workload/code.
 
See Also:
 
<https://support.microsoft.com/en-us/kb/2154845>
 
<http://www.sqlskills.com/blogs/paul/correctly-adding-data-files-tempdb/>
 
<http://blogs.msdn.com/b/psssql/archive/2008/12/17/sql-server-2005-and-2008-trace-flag-1118-t1118-usage.aspx>


### Tempdb Large Version Store
Severity: `1`
Version: `3` 

Tags: `TempDB` | `11.2.3` 

Evaluates to True when the tempdb version store is greater than 100,000
KB.
 
When snapshot isolation is in use, this can be an indicator that open
transactions are preventing cleanup of the version store. The store is
managed at the instance level, so an open transaction in one database
will prevent cleanup for all databases.
 
To find open transactions, run DBCC OPENTRAN or query the
sys.dm\_tran\_xxx dmvs.
 
See Also:
<http://www.brentozar.com/archive/2013/01/implementing-snapshot-or-read-committed-snapshot-isolation-in-sql-server-a-guide/>


### Tempdb Low Unallocated Page Count
Severity: `0`
Version: `6` 

Tags: `Auto-growth` | `Data/Log File` 

This condition evaluates to True when less than 10% of tempdb's page
count is unallocated.  This may indicate that tempdb is running out of
space and will soon experience autogrowth or hit a size limit.
 
See Also:
<https://msdn.microsoft.com/en-us/library/ms174412.aspx>


### Tempdb Unequal File Sizes
Severity: `1`
Version: `5` 

Tags: `Auditing` | `Auto-growth` | `Performance` | `UpdateForPublish` | `11.2.3` 

The benefits of having multiple tempdb files can be lost if one of those
files grows larger than the other files. This condition will evaulate to
True if your tempdb files are not the same size.
 
The query counts the distinct tempdb file sizes from sys.master\_files.
 
See Also:
<https://blogs.sentryone.com/aaronbertrand/sql-server-2016-tempdb-fixes/>
 
<http://www.sqlskills.com/blogs/paul/correctly-adding-data-files-tempdb/>


### Tintri High Datastore Throttle Latency
Severity: `1`
Version: `0` 

Tags: `Tintri` | `Disk` | `11.2.3` 

Throttle latency occurs on a Tintri VMstore storage appliance when a
VM's IOPS are being actively throttled via QoS. This is shown on the
Disk Activity\>Latency chart for a Tintri VMstore and its VMs.
 
See Also:
<https://www.tintri.com/blog/2015/04/vm-level-qos-redefines-quality>
 
<https://blogs.sentryone.com/justinrandall/monitoring-tintri-vm-stores-sneak-preview/>


### Tintri High vDisk Throttle Latency
Severity: `1`
Version: `0` 

Tags: `Tintri` | `Disk` | `11.2.3` 

Throttle latency occurs on a Tintri VMstore storage appliance when a
VM's IOPS are being actively throttled via QoS. This is shown on the
Disk Activity\>Latency chart for a Tintri VMstore and its VMs.
 
See Also:
<https://www.tintri.com/blog/2015/04/vm-level-qos-redefines-quality>
 
<https://blogs.sentryone.com/justinrandall/monitoring-tintri-vm-stores-sneak-preview/>


### Tintri High VM Throttle Latency
Severity: `1`
Version: `0` 

Tags: `Tintri` | `Disk` | `11.2.3` 

Throttle latency occurs on a Tintri VMstore storage appliance when a
VM's IOPS are being actively throttled via QoS. This is shown on the
Disk Activity\>Latency chart for a Tintri VMstore and its VMs.
 
See Also:
<https://www.tintri.com/blog/2015/04/vm-level-qos-redefines-quality>
 
<https://blogs.sentryone.com/justinrandall/monitoring-tintri-vm-stores-sneak-preview/>


### Trace Flags Number Turned On Changed
Severity: `1`
Version: `4` 

Tags: `Auditing` 

This condition evaluates to True when the number of trace flags set to
ON (status = 1) has changed.
 
The query analyzes the results of DBCC TRACESTATUS WITH NO\_INFOMSGS to
determine the status of the trace flags.


### Trace Flags Total Number Changed
Severity: `1`
Version: `3` 

Tags: `Auditing` 

This condition evaluates to True when the number of trace flags enabled
on the system has changed.
 
The query analyzes the results of DBCC TRACESTATUS WITH NO\_INFOMSGS to
determine the status of the trace flags.


### VMware High Ballooning 
Severity: `2`
Version: `3` 

Tags: `VMware` | `Virtualization` 

This VMware-specific condition evaluates to True when a significant
amount of memory has been reclaimed by the host machine from the guest
virtual machine(s).
 
See Also:
<https://www.vmware.com/files/pdf/perf-vsphere-memory_management.pdf>


### VMware High Co-Stop %
Severity: `1`
Version: `4` 

Tags: `VMware` | `Virtualization` 

This condition evaluates to True when the VMware Co-Stop time value is
greater than 3%.
 
This is the time that a virtual machine is ready to run, but unable to
run due to co-scheduling constraints. May be indicative of too many vCPU
resources.
 
See Also: 
<https://www.vmware.com/support/developer/converter-sdk/conv60_apireference/cpu_counters.html>


### VMware High Ready Time % per vCPU - Warning
Severity: `2`
Version: `5` 

Tags: `VMware` | `Virtualization` 

This VMware-specific condition evaluates to True when Ready Time % per
vCPU is within the warning threshold.
 
When a vCPU is ready to do work, but is waiting for the hypervisor to
schedule that work on one or more physical CPUs, the vCPU accumulates
Ready Time. This is often caused by having a high ratio of vCPUs to
physical CPUs on the host machine or having VMs of significantly
different sizes (by vCPU count) on the same host. 
 
See Also:
<https://www.sqlskills.com/blogs/jonathan/cpu-ready-time-in-vmware-and-how-to-interpret-its-real-meaning/>


### VMware High Ready Time % per vCPU
Severity: `2`
Version: `4` 

Tags: `VMware` | `Virtualization` 

This VMware-specific condition evaluates to True when Ready Time % per
vCPU is critically high.
 
When a vCPU is ready to do work, but is waiting for the hypervisor to
schedule that work on one or more physical CPUs, the vCPU accumulates
Ready Time. This is often caused by having a high ratio of vCPUs to
physical CPUs on the host machine or having VMs of significantly
different sizes (by vCPU count) on the same host.
  
See Also:
<https://www.sqlskills.com/blogs/jonathan/cpu-ready-time-in-vmware-and-how-to-interpret-its-real-meaning/>


### Windows Low Memory Notification
Severity: `1`
Version: `3` 

Tags: `Performance` | `Memory` 

This condition queries the SQL Server ring buffer for recent occurrences
of system-level RESOURCE\_MEMPHYSICAL\_LOW alerts.

These occur when Windows signals that physical memory is low, and can cause SQL Server to release its memory in response.
 
See Also:
How It Works: What are the RING\_BUFFER\_RESOURCE\_MONITOR telling me?

<http://blogs.msdn.com/b/psssql/archive/2009/09/17/how-it-works-what-are-the-ring-buffer-resource-monitor-telling-me.aspx>

Using sys.dm\_os\_ring\_buffers To Diagnose Memory Issues in SQL Server

<http://blogs.msdn.com/b/mvpawardprogram/archive/2012/06/04/using-sys-dm-os-ring-buffers-to-diagnose-memory-issues-in-sql-server.aspx>


## S1 Team Submitted

### Database Backup Diff SLA Breached
Severity: `1`
Version: `9` 

Tags: `HA/DR` | `Submit for Publish` 

Checks all User databases to find the last Differential backup for each
database.
 
Ignores TempDB and ReportServerTempDB databases.
Ignores Read Only databases
Ignores databases in a standby state
Ignores databases identified as a database snapshot
Ignores AG databases that are not designated preferred backup replica
 
Uses a variable @BackupThresholdMins
 
Format for setting the variable is minutes \* hours \* days
SELECT @BackupThresholdMins = 60 \* 24 \* 1
Default is 1 day, please change to meet your own SLA's
 
Set to check every 12 hours.
 
Author: AYun


### Database Backup Full SLA Breached
Severity: `2`
Version: `8` 

Tags: `HA/DR` | `Submit for Publish` 

Checks all User databases to find the last Full backup for each
database.
 
Ignores TempDB and ReportServerTempDB databases.
Ignores Read Only databases
Ignores databases in a standby state
Ignores databases identified as a database snapshot
Ignores AG databases that are not designated preferred backup replica
 
Uses a variable @BackupThresholdMins
 
Format for setting the variable is minutes \* hours \* days
SELECT @BackupThresholdMins = 60 \* 24 \* 1
Default is 1 day, please change to meet your own SLA's
 
Set to check every 12 hours.
 
Author: AYun


### Database Backup Log SLA Breached
Severity: `1`
Version: `7` 

Tags: `HA/DR` | `Submit for Publish` 

Checks against all user databases to find the last t-log backup for each
database.
 
Ignores TempDB and ReportServerTempDB databases.
Ignores Read Only databases
Ignores databases in a standby state
Ignores databases identified as a database snapshot
Ignores databases in Simple Recovery mode 
Ignores AG databases that are not designated preferred backup replica
 
Uses a variable @BackupThresholdMins
 
Format for setting the variable is minutes \* hours \* days
SELECT @BackupThresholdMins = 60 \* 1 \* 1
Default is 1 hour, please change to meet your own SLA's
 
Set to check every 15 minutes.


### Advisory Condition - Cleared (% Free Space - Disk Per Server)
Severity: `1`
Version: `24` 

Tags: `Submit for Publish` 

IMPORTANT: Must create a copy per Advisory Condition you wish to get an
"all clear" on.  This requires editing the Repository Query as well, and
substituting the name of the Advisory Condition.
 
Summary:
This code will, per server, monitor whether a given Advisory Conditon
that has been met, has changed back to a "cleared" status.  This has
been tested with SQL Sentry AC's but not with Global AC's, so may not
work properly against Global AC's.  
 
Author: AYun


### Database State - Offline
Severity: `2`
Version: `8` 

Tags: `Submit for Publish` | `HA/DR` 

Lists all databases that are in offline state.  Condition is met if the
list changes.
 
On some servers, having databases offline is perfectly okay, so review
the CSV output list of databases offline to see if there is a new
result.  
 
Will also check databases that are part of an AvailabilityGroup.
 
Author: AYun


### Database State - Suspect or Emergency
Severity: `3`
Version: `6` 

Tags: `HA/DR` | `Submit for Publish` 

Lists all databases that are in Suspect and/or Emergency state.
 Condition is met if the list changes.
 
Review the CSV output list of databases  
Will also check databases that are part of an AvailabilityGroup.
 
Author: AYun


### Database State Changed
Severity: `2`
Version: `3` 

Tags: `Submit for Publish` 

Detects if a database has changed state from the state it was in at the
prior evaluation.
 
This applies for any state change, so will alert for databases that are
come ONLINE, are intentionally taken OFFLINE, etc.
 
You can adjust this behavior to filter out Database States that are not
relevant to you, by adding a predicate filter.
 
Author: AYun


### Has KB Been Installed
Severity: `1`
Version: `3` 

Tags: `Building Block` | `Submit for Publish` 

Great example AC to check to see if a specific KB or hotfix was applied
to all SQL Servers.
 
Substitute KB of interest into WMI Query
 
Author: SWasheck


### SSAS Formula Engine Query Pool Job Queuing
Severity: `1`
Version: `1` 

Tags: `Performance` | `SSAS` 

The query pool refers to Formula Engine activity for queries. If you are
seeing consistently high queue lengths, but not high CPU utilization,
you many want to adjust your MaxThreads and/or CoordinatorExecutionMode
properties for your SSAS instance.
More details on these settings are covered in section 6.11 of
the [SSAS 2008 Performance
Guide](http://www.microsoft.com/download/en/details.aspx?displaylang=en&id=17303).
 
Remember that the FE is single threaded, so increasing the query pool
setting may not improve performance of any one query, but may improve
the performance in handling multiple simultaneous requests.


### SSAS High Memory Limit Exceeded
Severity: `2`
Version: `0` 

Tags: `Memory` | `Performance` | `SSAS` 

SSAS uses memory limit settings to determine how it allocates and
manages its internal memory.  Memory\\LowMemoryLimit defaults to 65% of
the total available physical memory on the machine (75% on AS2005),
and Memory\\TotalMemoryLimit (also sometimes called the High Memory
Limit) defaults to 80%.  This is the total amount of memory that the
SSAS process itself (msmdsrv.exe) can consume.
 
Once memory usage hits the Low limit, memory cleaner threads will kick
in and start moving data out of memory in a relatively non-aggressive
fashion.  If memory hits the Total limit, the cleaner goes into crisis
mode… it spawns additional threads and gets much more aggressive about
memory cleanup, and this can dramatically impact performance.
 
See Also:
<http://greg.blogs.sqlsentry.net/2009/06/analysis-services-memory-limits.html>.


### SSAS Low Memory Limit Exceeded
Severity: `1`
Version: `0` 

Tags: `Memory` | `SSAS` 

SSAS uses memory limit settings to determine how it allocates and
manages its internal memory.  Memory\\LowMemoryLimit defaults to 65% of
the total available physical memory on the machine (75% on AS2005),
and Memory\\TotalMemoryLimit (also sometimes called the High Memory
Limit) defaults to 80%.  This is the total amount of memory that the
SSAS process itself (msmdsrv.exe) can consume.
 
Once memory usage hits the Low limit, memory cleaner threads will kick
in and start moving data out of memory in a relatively non-aggressive
fashion.  If memory hits the Total limit, the cleaner goes into crisis
mode… it spawns additional threads and gets much more aggressive about
memory cleanup, and this can dramatically impact performance.
 
See Also:
<http://greg.blogs.sqlsentry.net/2009/06/analysis-services-memory-limits.html>.


### SSAS Storage Engine IO Job Queuing
Severity: `1`
Version: `4` 

Tags: `SSAS` 

The IOProcess thread pool separates reads from other activities. If the
I/O job queue length is consistently above 0, you may be experiencing an
IO bottleneck.
 
See the [Analysis Services MOLAP Guide for SQL Server 2012
and 2014](http://blogs.msdn.com/b/karang/archive/2014/05/28/analysis-services-molap-performance-guide-for-sql-server-2012-and-2014.aspx)
for more information, including optimizing for NUMA.


### SSAS Storage Engine Processing Pool Job Queuing
Severity: `1`
Version: `2` 

Tags: `SSAS` 

Depending on your version of SSAS, queuing of jobs in this pool can be
related to all Storage Engine activity (SSAS 2005 to 2008R2), or
strictly processing activity in SSAS 2012 and above.
 
See the appropriate Microsoft SSAS Performance Guide for more details on
optimizing this activity for your version of SSAS.


### SSAS Sustained Cache Evictions
Severity: `1`
Version: `2` 

Tags: `SSAS` 

If Cache Evictions/sec or Memory : KB shrunk/sec are consistently above
0, you likely have memory pressure on the SSAS instance.  This is often
seen when SSAS memory usage exceeds configured limits.


### SSAS Sustained Connection Failures
Severity: `2`
Version: `1` 

Tags: `SSAS` 

A sustained value above zero indicates an inability for users to
successfully connect to SSAS.  This could be related to overburdened
resources on the server.


### % Free Space - Disk Per Server
Severity: `1`
Version: `3` 

Tags: `Submit for Publish` 

A repository query that returns all disks (per monitored server) with
less than 10% free space. The alert format is returned as follows: Key
(server name), value (% free space).
 
Type is SQL Server, not SentryOne, which is useful if you wish to set
different thresholds on different types of servers (Dev vs Prod).
 
Author: AYun


### Windows Volume Exhaustion Date Changed
Severity: `1`
Version: `2` 

Tags: `` 

This Advisory Condition evaluates to True if any forecasted exhaustion
dates for any drives are within one year of the current date, and have
had that date change to be at least 30 days earlier than previously
forecast.
 
This can help identify situations where a new database has been
deployed, or a workload changed, possibly leading to accelerated
database growth.


### Windows Volume Forecasted Exhaustion Within 90 Days
Severity: `1`
Version: `0` 

Tags: `` 

This condition will check the Resource Exhaustion Dates (REDs) for all
forecasted volumes and return true if any occur within the next 90 days.
 
The value can be extended past 90 days, but note the REDs will only be
provided if they are calculated within the forecast range, which is 180
days by default.
 
This condition will return up to 100 records, which is the maiximum
configurable for any Advisory Condition.



