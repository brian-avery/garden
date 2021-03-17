---
---

* Producers write to partition, consumers read from it

* Consumers increment data themselves

* configuration information is stored in zookeeper

Data is stored in topics, which can be divided into partitions. Partitions live on one disk on one system, but can be replicated to additional systems. If a partition is replicated n times, it can survive n-1 failures.

Until the message is committed (at offset), producers won't receive acknowledgement. At this point, producer gets a response that the data has been received by the consumer.

Leader is the first to respond, often the oldest. If the leader dies, kafka reelects one, but there is a delay

**Replication**

*   Brokers are consumers when replication is running. Only difference  is that the id is -1 for a normal consumer and has a value for replica servers.  
*   Replication nodes are called ISR (in sync replicas)  
*   Each partition gets a leader. 
    

**Scripts**

*  Kafka has many useful scripts in the /opt/kafka/bin directory
    

**Producer**

*  Can require nothing from the brokers, can require leader recognition, or can require quorum for x servers.   
*   Use binary, string, or custom encoders. Consumers have decoders
    
  ***
_References_

[https://youtu.be/GRPLRONVDWY](https://youtu.be/GRPLRONVDWY "Share link")