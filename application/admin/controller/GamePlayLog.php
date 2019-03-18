<?php
/**
 * Created by PhpStorm.
 * User: TXCMS_V1
 * Date: 2018-10-16
 * Time: 9:32
 */

namespace app\admin\controller;

use app\admin\model\GamePlayLog as GamePlayLogModel;
use function MongoDB\BSON\fromJSON;
use think\Config;
use think\Db;

class GamePlayLog extends Base
{
    /**
     * 游戏对局日志
     * @param string $game
     * @param string $start
     * @param string $end
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index($game = '', $start = '', $end = '')
    {
        $GamePlayLogModel = new GamePlayLogModel();
        if ($game) {
            $GamePlayLogModel->where('l.name', trim($game));
        }
        if ($start && !$end) {
            $startTime = strtotime($start);
            $GamePlayLogModel->where('create_time', 'egt', $startTime);
        }
        if (!$start && $end) {
            $endTime = strtotime($end);
            $GamePlayLogModel->where('create_time', 'elt', $endTime);
        }
        if ($start && $end) {
            $startTime = strtotime($start);
            $endTime = strtotime($end);
            $GamePlayLogModel->where('create_time', 'between', [$startTime, $endTime]);
        }
        if ($game != '' || $start != '' || $end != '') {
            $this->assign('quick', '<input type="button" name="Submit" class="btn btn-default radius" onclick="javascript:history.back(-1);" value="返回">');
        }
        $data = $GamePlayLogModel->alias('g')
            ->field('g.id gid,r.id rid,g.level,g.create_time,g.end_time,l.name,g.info')
            ->join('game_list l', 'g.game_id=l.id')
            ->join('game_room r', 'r.game_id=l.id', 'left')
            ->paginate(Config::get('myConfig.page_num'), false, ['query' => $_GET]);
        $page = $data->render();
        $this->assign('page', $page);
        $this->assign('data', $data);
        return $this->fetch();
    }

    /**
     * 空操作方法
     */
    public function _empty()
    {
        $this->redirect('game_play_log/index');
    }

}