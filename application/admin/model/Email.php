<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-9-11
 * Time: 18:04
 */

namespace app\admin\model;


use think\Config;
use think\Model;

class Email extends Model
{
    public function user()
    {
        return $this->hasOne('user', 'id', 'user_id');
    }


    /**
     *  获取邮件信息关联user表
     * @return \think\Paginator
     */
    public function getEmailInfo()
    {
        $result = $this->with('user')->order('id desc')->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        return $result;
    }

    /**
     *  查询用户
     * @param $value
     * @param $data
     * @return string
     */
    public function getEmailUserNameAttr($value, $data)
    {
        $data = self::where('id', $data['id'])->find();
        $result = User::get(['id', $data->user_id]);
        return $result['nickname'] ?? '';
    }

    /**
     *  获取编辑用户数据
     * @param int $id
     * @return bool|null|static
     */
    public function getEditData(int $id)
    {
        $result = $this->get($id);
        if ($result) {
            return $result;
        } else {
            return false;
        }
    }

    /**
     *  邮件数据更新
     * @param int $id
     * @param int $user_id
     * @param $context
     * @param $status
     * @return array|bool|int|string
     */
    public function editDataSave(int $id, int $user_id, $context, $status)
    {
        $result = $this->table('user')->where('id', $user_id)->find();
        if (!$result) {
            return 1; // 用户id不存在
        }
        $Email = new Email();
        $data = ['user_id' => $user_id, 'context' => $context, 'status' => $status];
        $result = $Email->validate(
            [
                'user_id' => 'require|number',
                'context' => 'require',
            ],
            [
                'user_id.require' => '用户id不能为空',
                'user_id.number' => '用户必须是数字',
                'content.require' => '内容不能为空',
            ]
        )->save($data, ['id' => $id]);
        if (false === $result) {
            // 验证失败 输出错误信息
            return $Email->getError();
        } else {
            return true;
        }
    }


    /**
     *  保存邮件信息
     * @param int $user_id
     * @param $context
     * @param $name
     * @return array|bool|int|string
     */
    public function saveEmailData(int $user_id, $context, $name)
    {
        $result = $this->table('user')->where('id', $user_id)->find();
        if (!$result) {
            return 1; // 用户id不存在
        }
        $Email = new Email();
        $data = ['user_id' => $user_id, 'context' => $context, 'name' => $name];
        $result = $Email->validate(
            [
                'user_id' => 'require|number',
                'context' => 'require',
            ],
            [
                'user_id.require' => '用户id不能为空',
                'user_id.number' => '用户必须是数字',
                'content.require' => '内容不能为空',
            ]
        )->save($data);
        if (false === $result) {
            // 验证失败 输出错误信息
            return $Email->getError();
        } else {
            return true;
        }
    }

    /**
     *  删除邮件
     * @param int $id
     * @return bool
     */
    public function emailDel(int $id)
    {
        $result = $this->table('email')->where('id', $id)->find();
        if (!$result) {
            return false;
        }
        $result = $this->table('email')->where('id', $id)->delete();
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

}