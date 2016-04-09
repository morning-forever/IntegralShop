package com.bm.common.util.sync.thread;

import java.util.Date;
import java.util.Stack;

import com.bm.common.util.sync.ITaskHandler;
import com.bm.common.util.sync.SyncTask;

/**
 * 
 * 本地失败任务操作
 * 
 * @author mike
 *
 */
public class FailTaskThread implements Runnable {
	
	private static Stack<SyncTask> taskStack = new Stack<SyncTask>();
	
	public static boolean isRun = true;
	
	private static FailTaskThread instance;
	
	public synchronized static FailTaskThread newInstance(){
		if(instance==null)
			synchronized (FailTaskThread.class) {
				if(instance==null)
					instance = new FailTaskThread();
			}
		return instance;
	} 
	
	private FailTaskThread() {
		Thread t = new Thread(this);
		t.start();
		System.out.println("-------The local fail Thread instance success,the task Thread start success!");
	}
	
	public static void addTask(SyncTask task){
		taskStack.add(task);
	}
	
	@Override
	public void run() {
		while(isRun){
			SyncTask task = null;
			try {
				if(taskStack.size()>0){
					task = taskStack.get(0);
					doTask(task);
				}
			} catch (Exception e) {
				System.out.println(new Date()+" : -------AT:local fail - 失败任务     taskId:"+task.getTaskId()+"\t params:"+task.getParams());
				e.printStackTrace();
			}finally{
				try {
					Thread.sleep(1000l);
					//this.run();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	private static void doTask(SyncTask task) throws Exception{
		try {
			System.out.println(new Date()+" : -------AT:local fail - 执行任务      taskId:"+task.getTaskId()+"\t params:"+task.getParams());
			ITaskHandler taskHandler = task.getTaskHandler();
			taskHandler.execute(task.getParams(), task.getTaskId());
			taskStack.remove(task);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(new Date()+" : -------AT:local fail - taskId:"+task.getTaskId()+"\t"+e.getMessage()+"-------同步线程执行出现异常！！！");
		}
	}
}
