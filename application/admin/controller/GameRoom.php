<?php
/**
 * Created by PhpStorm.
 * User: TXCMS_V1
 * Date: 2018-11-6
 * Time: 16:38
 */

namespace app\admin\controller;

use app\admin\model\GameRoom as MgameRoom;
use app\admin\model\GameList as MgameList;
use think\Config;

class GameRoom extends Base
{
    public function index()
    {
        $GameRoom = new MgameRoom();
        $result = $GameRoom->paginate(Config::get('myConfig.page_num'),false,['query'=>$_GET]);
        $page = $result->render();
        $this->assign('data',$result);
        $this->assign('page',$page);
        return $this->fetch();
    }

    /**
     * 游戏房间编辑
     * @param int $id
     * @return mixed
     * @throws \think\Exception
     * @throws \think\exception\DbException
     */
    public function bot_edit($id=0)
    {
        $GameRoom = new MgameRoom();
        $result = $GameRoom->get($id)->toArray();
        $this->assign('data',$result);
        return $this->fetch();
    }

    /**
     * 编辑保存
     * @param int $id
     * @param string $bot
     * @param string $stint
     * @return array
     */
    public function edit_save($id=0,$bot='',$stint='')
    {
        if(empty($bot) && empty($stint)){
            return ['code'=>0,'msg'=>'不能为空哦'];
        }
        $GameRoom = new MgameRoom();
        $result = $GameRoom->update_room($id,$bot,$stint);
        if($result){
            return ['code'=>1,'msg'=>'编辑成功'];
        }else{
            return ['code'=>0,'msg'=>'编辑失败'];
        }
    }

    /**
     * 百人牛牛
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function one_hundred()
    {
        $list_data = MgameList::get(['id',1]);
        $room_data = MgameRoom::get(['game_id',1]);
        $this->assign('list_data',$list_data);
        $this->assign('room_data',$room_data);
        return $this->fetch();
    }

    /**
     * 抢庄牛牛
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function grab_the_cattle()
    {
        $list_data = MgameList::get(['id',2]);
        $room_data = MgameRoom::get(['game_id',2]);
        $this->assign('list_data',$list_data);
        $this->assign('room_data',$room_data);
        return $this->fetch();
    }

    /**
     * 炸金花
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function fried_golden_flower()
    {
        $list_data = MgameList::get(['id',3]);
        $room_data = MgameRoom::get(['game_id',3]);
        $this->assign('list_data',$list_data);
        $this->assign('room_data',$room_data);
        return $this->fetch();
    }

    /**
     * 德州扑克
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function texas_playing_card()
    {
        $list_data = MgameList::get(['id',4]);
        $room_data = MgameRoom::get(['game_id',4]);
        $this->assign('list_data',$list_data);
        $this->assign('room_data',$room_data);
        return $this->fetch();
    }

}