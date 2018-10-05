"""This is a test to see if I can create multiple nodes and assign all their information with a loop.

Instructions:
This is now an experimental profile, instatiation may result in unknown consequences. Check source for a better understanding.
"""

import geni.portal as portal
import geni.rspec.pg as pg
import geni.rspec.igext

# Describe the parameter(s) this profile script can accept.
portal.context.defineParameter( "n", "Number of VMs", portal.ParameterType.INTEGER, 4 )
#portal.context.defineParameter( "os", "disk image", portal.ParameterType.DISK_IMAGE, "urn:publicid:IDN+emulab.net+image+emulab-ops:CENTOS7-64-STD")

# Retrieve the values the user specifies during instantiation.
params = portal.context.bindParameters()

# Create a Request object to start building the RSpec.
request = portal.context.makeRequestRSpec()

# Check parameter validity.
if params.n < 1 or params.n > 4:
    portal.context.reportError( portal.ParameterError( "You must choose at least 1 and no more than 4 VMs." ) )

link = request.LAN("lan")
    
for i in range( params.n ):
    # Create a XenVM and add it to the RSpec.
    #node = request.XenVM( "node-" + str( i + 1) )
    
  if i == 0:
    node = request.XenVM("head")
    node.addService(pg.Execute(shell="sh", command="sudo chmod 755 /local/repository/install_NSF_head.sh"))
    node.addService(pg.Execute(shell="sh", command="sudo /local/repository/install_NSF_head.sh"))
    node.routable_control_ip = "true"
  elif i == 1:
    node = request.XenVM("metadata")
  elif i == 2:
    node = request.XenVM("storage")
    node.addService(pg.Execute(shell="sh", command="sudo chmod 755 /local/repository/install_NSF_storage.sh"))
    node.addService(pg.Execute(shell="sh", command="sudo /local/repository/install_NSF_storage.sh"))
  else:
    node = request.XenVM("compute-" + str(i-2))
    node.addService(pg.Execute(shell="sh", command="sudo chmod 755 /local/repository/install_NSF_client.sh"))
    node.addService(pg.Execute(shell="sh", command="sudo /local/repository/install_NSF_client.sh"))
    node.cores = 2
    node.ram = 4096
    
  node.disk_image = "urn:publicid:IDN+emulab.net+image+emulab-ops:CENTOS7-64-STD"
    #if (i + 1) == 1:
    #    node.routable_control_ip = True
  iface = node.addInterface("if1")
    
    # Specify the component id and the IPv4 address
  iface.component_id = "eth1"
  iface.addAddress(rspec.IPv4Address("192.168.1." + str( i + 1 ), "255.255.255.0"))

  link.addInterface(iface)

#node1 = request.XenVM("node1")
#iface1 = node1.addInterface("if1")

## Specify the component id and the IPv4 address
#iface1.component_id = "eth1"
#iface1.addAddress(rspec.IPv4Address("192.168.1.1", "255.255.255.0"))

#node2 = request.XenVM("node2")
#iface2 = node2.addInterface("if2")

## Specify the component id and the IPv4 address
#iface2.component_id = "eth2"
#iface2.addAddress(rspec.IPv4Address("192.168.1.2", "255.255.255.0"))

#link = request.LAN("lan")

#link.addInterface(iface1)
#link.addInterface(iface2)

portal.context.printRequestRSpec()
