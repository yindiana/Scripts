import os

from ansible.module_utils.basic import AnsibleModule
from ansible.module_utils.common.text.converters import to_text

def search_files(path) :
    files = ""
    for file in os.listdir(path):
        files = files + file + "\n"    
    
    return files

module = AnsibleModule(
    argument_spec=dict(
    path=dict(type='str', required=True)))

r = {'changed': True,
     'file_list': ""}

r['file_list'] = search_files(module.params["path"])

# if failure:
#     module
# else:
#     r['changed'] = int(r['stdout'])

module.exit_json(**r)
