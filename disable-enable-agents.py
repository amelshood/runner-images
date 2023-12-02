import requests

def disable_enable(pool_id: int, agent_id: int, headers:json, enable:str):
  """Disable or enable an ADO agent

  Args:
      pool_id (int) : The ADO pool ID to analyze
      agent_id (int): The ADO agent ID to disable
      headers       : The ADO headers
      enable (bool) : True to enable, False to disable
  """
  payload={"id":agent_id,"enabled":enable}
  r = requests.request("PATCH",("https://dev.azure.com/swissre/_apis/distributedtask/pools/" + str(pool_id) + "/agents/" + str(agent_id) + "?api-version=7.0", headers, payload)
  print("Agent {} enable: {}.".format(agent_id, enable))
  rJson = r.json()
  print(rJson)